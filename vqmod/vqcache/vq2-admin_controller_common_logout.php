<?php
class ControllerCommonLogout extends Controller {
	public function index() {
		
				unset($_SESSION['is_admin']);
			

		unset($this->session->data['token']);

		$this->response->redirect($this->url->link('common/login', '', 'SSL'));
	}
}