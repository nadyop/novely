<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';
require APPPATH . '/libraries/TwitterAPIExchange.php';

class Twitter extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('twitter_model');
        $this->isLoggedIn();
    }

    /**
     * This function used to load the first screen of the user
     */
    public function index()
    {
        $this->global['pageTitle'] = 'NOVELY';

        $this->loadViews("twitter", $this->global, NULL , NULL);
    }

    /**
     * This function is used to add new user to the system
     */
    function postTwitter()
    {
		// reference
		// https://dev.twitter.com/rest/reference

		ini_set('display_errors', 1);

		$settings = array(
			'oauth_access_token' => "932117402518675456-uuoqqFkQFlpaFZTyMEmrVtRWT2QXHJ8",
			'oauth_access_token_secret' => "915aA31xOTfdswt4TiomoqP5N1b3puO3vAZWWjBLatwAL",
			'consumer_key' => "UGDD8RNviHbCjRbyddjFrwBgR",
			'consumer_secret' => "Pmf70d7EoSazBl1swmdIFH6xlujQW5Td0GBXbZuVW49bIoPg1u"
		);

		// end point URL for POST
		$url = 'https://api.twitter.com/1.1/statuses/update.json';

        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');

            $this->form_validation->set_rules('title','required|max_length[128]|xss_clean');
            $this->form_validation->set_rules('isi','required|max_length[128]|xss_clean');

            if($this->form_validation->run() == FALSE)
            {
                $this->addNew();
            }
            else
            {
                $judul = $this->input->post('judul');
                $isi = $this->input->post('isi');
				        $content = $judul."\n".$isi;

                // kirim ke database nya
                $postInfo = array('judul'=>$judul, 'isi'=>$isi);

                $this->load->model('twitter_model');
                $result = $this->twitter_model->addNewPost($postInfo);

				// post field ke twitter
				$postfields = array(
					'status' => "$content"
				);

				// methodnya
				$requestMethod = 'POST';

				$twitter = new TwitterAPIExchange($settings);
				$result = $twitter->buildOauth($url, $requestMethod)
							 ->setPostfields($postfields)
							 ->performRequest();
				// print_r($result);

                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'New Post created successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Post creation failed');
                }

                redirect('twitter');
            }
        }
    }

	    /**
     * This function is used to load the add new form
     */
    function addNew()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $this->global['pageTitle'] = 'CodeInsect : Add New Post';

            $this->loadViews("twitter", $this->global, NULL, NULL);
        }
    }

    function pageNotFound()
    {
        $this->global['pageTitle'] = 'CodeInsect : 404 - Page Not Found';

        $this->loadViews("404", $this->global, NULL, NULL);
    }
}

?>
