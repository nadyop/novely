<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

/**
 * Class : User (UserController)
 * User Class to control all user related operations.
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
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
        $this->global['pageTitle'] = 'CodeInsect : Dashboard';

        $this->loadViews("twitter", $this->global, NULL , NULL);
    }
    
    /**
     * This function is used to add new user to the system
     */
    function postTwitter()
    {
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
				
                $postInfo = array('judul'=>$judul, 'isi'=>$isi);
                
                $this->load->model('twitter_model');
                $result = $this->twitter_model->addNewPost($postInfo);
                
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