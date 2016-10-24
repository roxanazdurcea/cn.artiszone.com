<?php
/**
 * @author tshirtecommerce - www.tshirtecommerce.com
 * @date: 2016-03-26
 *
 * API
 *
 * @copyright  Copyright (C) 2015 tshirtecommerce.com. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE
 *
 */
 
class ControllerTshirtecommerceDesignerApi extends Controller
{
	public function login()
	{
		$data 		 = array('error' => 0, 'id' => 0);
		$is_login 	 = 0;
		$id 		 = 0;
		$email 		 = '';
		$password 	 = '';
		$this->load->model('account/customer');
				
		if(isset($_POST['username'])) $email = $_POST['username'];
		if(isset($_POST['password'])) $password = $_POST['password'];
	
		if ($this->customer->login($email, $password))
		{
			$is_login = 1;
		}

		if ($this->customer->isLogged())
		{
			$logged = array('login' => TRUE, 'email' => $email, 'id' => $this->customer->isLogged());
			
			$_SESSION['is_logged'] = $logged;
			
			$is_login = 1;
			$id 		= md5($this->customer->isLogged());
			
		}
		
		$data['error'] 	= $is_login;
		$data['id'] 	= $id;
		
		echo json_encode($data);
		return;
	}
	
	public function register()
	{
		$arr 		= array('error' => 0, 'id' => 0);
		$is_login 	= 0;

		$id 		= 0;
		$email 		= '';
		$password 	= '';
		$this->language->load('module/tshirtecommerce');

		$this->load->model('account/customer');
		
		if(isset($_POST['email'])) $email = $_POST['email'];
		if(isset($_POST['password'])) $password = $_POST['password'];
		
		$first_name = $this->strbefore($email, '@');
		$last_name = '';
		
		$data = array(
			'customer_group_id' => 1,				// Default
			'firstname' 		=> $first_name, 	// First Name
			'lastname' 			=> $last_name, 		// Last Name
			'email' 			=> $email, 			// E-Mail
			'telephone' 		=> '123-456789', 	// Telephone
			'fax' 				=> '', 				// Fax
			'custom_field' 		=> '', 				// Company
			'newsletter' 		=> 1,               // Enable
			'salt' 				=> '',				
			'password' 			=> $password, 		// Password
			'status' 			=> 1,				// Enable
			'approved' 			=> 1,				// Yes
			'safe' 				=> 1,				// No
			'company'			=> '',
			'address_1'			=> '',
			'address_2'			=> '',
			'city'				=> '',
			'postcode'			=> '',
			'country_id'		=> '',
			'zone_id'			=> ''
		);
		
		$is_login = $this->validate($email);
		if($is_login >= 0)
		{
			$customer_id = $this->add_customer($data);
	
			if ($this->customer->isLogged())
			{
				$logged = array('login' => TRUE, 'email' => $email, 'id' => $this->customer->isLogged());
					
				$_SESSION['is_logged'] = $logged;

				$is_login 	= 1;
				$id 		= md5($this->customer->isLogged());
			}
		}
		
		$arr['error'] 	= $is_login;
		$arr['id'] 		= $id;

		echo json_encode($arr);
		return;
	}
	
	protected function add_customer($data)
	{
		if ($this->customer->isLogged())
		{
			$this->response->redirect($this->url->link('account/account', '', TRUE));
		}
		
		$this->load->model('account/customer');
		
		$customer_id = $this->model_account_customer->addCustomer($data);
		
		// Clear any previous login attempts for unregistered accounts.
		$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);

		$this->customer->login($this->request->post['email'], $this->request->post['password']);

		unset($this->session->data['guest']);

		// Add to activity log
		$this->load->model('account/activity');

		$activity_data = array(
			'customer_id' => $customer_id,
			'name'        => $this->request->post['firstname'] . ' ' . $this->request->post['lastname']
		);

		$this->model_account_activity->addActivity('register', $activity_data);

		return 1;
	}
	
	// For customers
	public function valid_customer()
	{
		$id 	= 0;
		$logged = (isset($_SESSION['is_logged'])) ? $_SESSION['is_logged'] : (array('login' => FALSE,'email' => '','id' => 0));
		
		if($logged['id'] > 0 && $this->customer->isLogged())
		{
			$id = $this->customer->isLogged();
			if($id > 0) $id = md5($id);
		}
		echo ($id);
		return;
	}
	
	protected function strbefore($string, $substring)
	{
		$pos = strpos($string, $substring);
		if ($pos === FALSE) { return $string; }
		else { return(substr($string, 0, $pos)); }
	}
	
	protected function validate($email)
	{
		$valid = 1;
		if ((utf8_strlen($email) > 96) || !filter_var($email, FILTER_VALIDATE_EMAIL))
		{
			$valid = -1;
		}
		elseif ($this->model_account_customer->getTotalCustomersByEmail($email))
		{
			$valid = -2; // Warning: E-Mail Address is already registered!
		}
		else
		{
			$valid = 0;
		}
		
		return $valid;
	}
}
