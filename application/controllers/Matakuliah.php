<?php

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

	class Matakuliah extends REST_Controller{
		
		public function kategori_get(){
			$jenisMk=$this->get('jenisMk');
			$result=$this->db->query("select * from matakuliah where jenismk='$jenisMk'")->result();
			$this->response($result,REST_Controller::HTTP_OK);
		}
		
		public function index_get(){
			$idMk = $this->get('idMk');
			
			if(empty($idMk)){
				$mk = $this->db->get('mataKuliah')->result();
				$this->response($mk,200);
			}
			else{
				$this->db->where('idMk',$idMk);
				$mk = $this->db->get('mataKuliah')->result();
				
				if(empty($idmk)){
					$this->response(null,404);
				}
				else{
					$this->response($buku,200);
				}
			}
		}
	}
?>