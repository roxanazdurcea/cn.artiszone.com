<?php
class ControllerModuleCategory extends Controller {
	public function index() {
		$this->load->language('module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		
		if (isset($parts[2])) {
			$data['subchild_id'] = $parts[2];
		} else {
			$data['subchild_id'] = 0;
		}
		
		$categories_1 = $this->model_catalog_category->getCategories(0);

		foreach ($categories_1 as $category_1) {
			$level_2_data = array();

			if ($category_1['category_id'] == $data['category_id']) {
				$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);

				foreach($categories_2 as $category_2) {
					$filter_2_data = array('filter_category_id' => $category_2['category_id'], 'filter_sub_category' => true);
					
					$level_3_data = array();
					$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
					
					foreach($categories_3 as $category_3) {
						$filter_3_data = array('filter_category_id' => $category_3['category_id'], 'filter_sub_category' => true);

						$level_3_data[] = array(
							'category_id' => $category_3['category_id'],
							'name' => $category_3['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_3_data) . ')' : ''),
							'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id'])
						);
					}

					$level_2_data[] = array(
						'category_id' => $category_2['category_id'],
						'name' => $category_2['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_2_data) . ')' : ''),
						'children' => $level_3_data,
						'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'])
					);
				}
			}

			$filter_1_data = array(
				'filter_category_id'  => $category_1['category_id'],
				'filter_sub_category' => true
			);

			$data['categories'][] = array(
				'category_id' => $category_1['category_id'],
				'name'        => $category_1['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_1_data) . ')' : ''),
				'children'    => $level_2_data,
				'href'        => $this->url->link('product/category', 'path=' . $category_1['category_id'])
			);
		}
		































		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/category.tpl', $data);
		} else {
			return $this->load->view('default/template/module/category.tpl', $data);
		}
	}
}