<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rajaongkir extends CI_Controller {

	public function index()
	{
		$this->load->view('cek_ongkir');
	}

	function getCost()
	{
		$origin = $this->input->get('origin');
		$destination = $this->input->get('destination');
		$berat = $this->input->get('berat');
		$courier = $this->input->get('courier');

		$data = array('origin' => $origin,
						'destination' => $destination,
						'berat' => $berat,
						'courier' => $courier

		);

		$this->load->view('rajaongkir/getCost', $data);
	}

}
