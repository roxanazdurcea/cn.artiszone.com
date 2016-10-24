<?php 

class ControllerModuleTshirtecommerce extends Controller {
	private $error;
	 public function index() {
		
		$this->install();
		
		$this->language->load('module/tshirtecommerce');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		// save config
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
		{
			$this->model_setting_setting->editSetting('tshirtecommerce', $this->request->post);
			
			$data['product_id'] = isset($this->request->post['tshirtecommerce_product']) ? $this->request->post['tshirtecommerce_product'] : 0;
			$data['design_downloadable'] = 0;
			if(isset($this->request->post['tshirtecommerce_downloadable']))
			{
				$data['tshirtecommerce_downloadable'] = 1;
			}

			$this->session->data['success'] = $this->language->get('text_success');
		}
		else
		{		
			$data['product_id'] = $this->config->get('tshirtecommerce_product');
			if(null !== $this->config->get('tshirtecommerce_downloadable'))
				$data['tshirtecommerce_downloadable'] = $this->config->get('tshirtecommerce_downloadable');
			else
				$data['tshirtecommerce_downloadable'] = 0;
		}

		$data['heading_title'] = $this->language->get('heading_title');
			
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		}
		
		if(!ini_get('allow_url_fopen') )
		{
			$data['error_warning'] = 'Your server not support <strong>allow_url_fopen</strong>. Please upload your hosting with <strong>allow_url_fopen = ON</strong>. Click <a href="https://tshirtecommerce.com/wp-content/uploads/2015/04/allow_url_fopen.png" target="_blank"><strong>HERE</strong></a> to see update!';
		}

		if (isset($this->error['code'])) {
			$data['error_code'] = $this->error['code'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);	
		
		$data['link'] = $this->url->link('module/tshirtecommerce', 'token=' . $this->session->data['token'], 'SSL');
		
		// get all product design
		$this->load->model('tshirtecommerce/order');
		$products = $this->model_tshirtecommerce_order->getProducts();
		$data['products'] = $products;

		$this->load->model('setting/setting');
		$settings = $this->model_setting_setting->getSetting('tshirtecommerce');
		$settings['tshirtecommerce_menu'] = 1;
		$this->model_setting_setting->editSetting('tshirtecommerce', $settings);
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/tshirtecommerce.tpl', $data));
	}
	
	public function install() {
		// only add tshirtecommerce when install module
		$this->load->model('setting/setting');
		$settings = $this->model_setting_setting->getSetting('tshirtecommerce');
		$settings['tshirtecommerce_menu'] = 1;
		$settings['design_downloadable'] = 0;
		$this->model_setting_setting->editSetting('tshirtecommerce', $settings);
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "tshirtdesign_order` (
		   `id` int(11) NOT NULL AUTO_INCREMENT,
		  `order_product_id` int(11) NOT NULL,
		  `options` text NOT NULL,  
		  PRIMARY KEY (`id`)
		)");
		
		// add field to product table
		$check = FALSE;
		$result = $this->db->query( "DESCRIBE `".DB_PREFIX."product`" );
		foreach ($result->rows as $row)
		{
			if ($row['Field'] == 'design_product_id')
			{
				$check = TRUE;
				break;
			}
		}
		
		if ($check === false)
		{
			$sql = "ALTER TABLE `".DB_PREFIX."product` ADD `design_product_id` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''";
			$this->db->query( $sql );
			
			$sql = "ALTER TABLE `".DB_PREFIX."product` ADD `design_product_title_img` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''";
			$this->db->query( $sql );
		}
	}

	protected function validate() {
		$this->language->load('module/tshirtecommerce');
		
		if (!$this->user->hasPermission('modify', 'module/tshirtecommerce')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>