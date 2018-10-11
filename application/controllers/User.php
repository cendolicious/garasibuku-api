<?php

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

	class User extends REST_Controller{
		
		public function edituser_post(){
			$nim = $this->post('nim');
			$data = array(
				'nama' => $this->post('nama'),
				'alamat' => $this->post('alamat'),
				'password' => $this->post('password'),
				'bio' => $this->post('bio'),
				'nohp' => $this->post('nohp'),
				'latitude' => $this->post('latitude'),
				'longitude' => $this->post('longitude')
			);
			$this->db->where('nim',$nim);
			$edituser = $this->db->update('user',$data);
			$result = $this->db->query("SELECT * FROM user WHERE nim='$nim'")->result();
			$this->response($result,REST_Controller::HTTP_OK);
		}
		
		public function login_get(){
			$nim=$this->get('nim');
			$password=$this->get('password');
			$result=$this->db->query("call autentikasi('$nim','$password')")->result();
			$this->response($result,REST_Controller::HTTP_OK);
		}
		
		public function datamem_get(){
			$nim=$this->get('nim');
			$result=$this->db->query("call userbynim('$nim')")->result();
			$this->response($result,REST_Controller::HTTP_OK);
		}
		
		public function index_get(){
			$nim = $this->get('nim');
			
			if(empty($nim)){
				$user = $this->db->get('user')->result();
				$this->response($user,200);
			}
			else{
				$this->db->where('nim',$nim);
				$user = $this->db->get('user')->result();
				
				if(empty($nim)){
					$this->response(null,404);
				}
				else{
					$this->response($user,200);
				}
			}
		}
		
		public function index_post(){
			$data = array(
				'nim' => $this->post('nim'),
				'nama' => $this->post('nama'),
				'alamat' => $this->post('alamat'),
				'password' => $this->post('password'),
				'bio' => $this->post('bio'),
				'nohp' => $this->post('nohp'),
				'latitude' => $this->post('latitude'),
				'longitude' => $this->post('longitude')
			);
			$insert = $this->db->insert('user',$data);
			if ($insert) {
				$this->response($data, 200);
			} else {
				$this->response(array('status' => 'fail', 502));
			}
		}
		
		public function index_put(){ //put di xform input data nya
			$nim = $this->put('nim');
			$data = array(
					'nim' => $this->put('nim'),
                    'nama' => $this->put('nama'),
					'password' => $this->put('password'),
                    'alamat' => $this->put('alamat'),
					'nohp' => $this->put('nohp'),
					'bio' => $this->put('bio'),
					'photo' => $this->put('photo')
				);
			$this->db->where('nim',$nim);
			$update = $this->db->update('user',$data);
			if ($update) {
            $this->response($data, 200);
			} else {
            $this->response(array('status' => 'fail', 502));
			}
		}
		
		
		
		public function index_delete(){ //delete di xform input data nya
			 $nim = $this->delete('nim');
        $this->db->where('nim', $nim);
        $delete = $this->db->delete('user');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
		}
	}
?>