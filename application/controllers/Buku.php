<?php

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

	class Buku extends REST_Controller{
		
		public function editbuku_post(){
			$idBuku = $this->post('idBuku');
			$data = array(
				'idmk' => $this->post('idmk'),
				'nim' => $this->post('nim'),
				'matakuliah' => $this->post('matakuliah'),
				'jenismk' => $this->post('jenismk'),
				'deskripsi' => $this->post('deskripsi'),
				'harga' => $this->post('harga'),
				'photo' => $this->post('photo'),
				'status' => $this->post('status')
			);
			$this->db->where('idBuku',$idBuku);
			$edituser = $this->db->update('buku',$data);
			$result = $this->db->query("SELECT * FROM buku WHERE idBuku='$idBuku'")->result();
			$this->response($result,REST_Controller::HTTP_OK);
		}
		
		public function deletebuku_post(){
			$idBuku=$this->get('idBuku');
			$result=$this->db->query("DELETE FROM buku WHERE idBuku='$idbuku'")->result();
			$this->response($result,REST_Controller::HTTP_OK);
		}
		
		public function kategori_get(){
			$jenisMk=$this->get('jenisMk');
			$result=$this->db->query("call bukubykategori('$jenisMk')")->result();
			$this->response($result,REST_Controller::HTTP_OK);
		}
		
		public function databukusearch_get(){
			$cari=$this->get('cari');
			$result=$this->db->query("call bukubysearch('$cari')")->result();
			$this->response($result,REST_Controller::HTTP_OK);
		}
		
		public function databuku_get(){
			$idBuku=$this->get('idBuku');
			$result=$this->db->query("call bukubyid('$idBuku')")->result();
			$this->response($result,REST_Controller::HTTP_OK);
		}
		
		public function databukunim_get(){
			$nim=$this->get('nim');
			$result=$this->db->query("call bukubynim('$nim')")->result();
			$this->response($result,REST_Controller::HTTP_OK);
		}
		
		public function index_get(){
			$idBuku = $this->get('idBuku');
			
			if(empty($idBuku)){
				$buku = $this->db->get('buku')->result();
				$this->response($buku,200);
			}
			else{
				$this->db->where('idBuku',$idBuku);
				$buku = $this->db->get('buku')->result();
				
				if(empty($idBuku)){
					$this->response(null,404);
				}
				else{
					$this->response($buku,200);
				}
			}
		}
		
		public function index_post(){
			$data = array(
				'idmk' => $this->post('idmk'),
				'nim' => $this->post('nim'),
				'deskripsi' => $this->post('deskripsi'),
				'harga' => $this->post('harga')
			);
			$insert = $this->db->insert('buku',$data);
			if ($insert) {
				$this->response($data, 200);
			} else {
				$this->response(array('status' => 'fail', 502));
			}
		}
		
		
		public function index_delete(){ //delete di xform input data nya
			$idBuku = $this->delete('idBuku');
			$this->db->where('idBuku', $idBuku);
			$delete = $this->db->delete('buku');
			if ($delete) {
				$this->response(array('status' => 'success'), 201);
			} else {
				$this->response(array('status' => 'fail', 502));
			}
		}
	}
?>