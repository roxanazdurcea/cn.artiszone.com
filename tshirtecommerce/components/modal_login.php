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
 
include_once ROOT .DS. 'includes' .DS. 'functions.php';
$dg = new dg();
$site_url = $dg->url();
if (isset($GLOBALS['languages']))
{
	$addons = $GLOBALS['addons']; ?>
	<div class="modal fade" id="f-login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div id="f-login-content" class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title" id="myModalLabel"><?php echo $addons->lang['designer_api_form_login'] ?></h4>
		  </div>
		  <div class="modal-body">
			
			<div class="row">
				<!-- login form -->
				<div class="col-md-12">		
					<form id="fr-login" role="form" style="margin-bottom: 5px;">						  						 
					  <div class="form-group">
						<label><?php echo $addons->lang['designer_api_user_your_email'] ?></label>
						<input type="text" id="login-username" class="form-control" placeholder='<?php echo $addons->lang['designer_api_user_your_email'] ?>'>
					  </div>
					  <div class="form-group">
						<label><?php echo $addons->lang['designer_api_user_your_password'] ?></label>
						<input type="password" id="login-password" class="form-control">
					  </div>
					</form>
					<p class="text-muted"><?php echo $addons->lang['designer_api_user_login_desctiption']; ?></p>
					<p id="login-status" class="alert alert-danger" style="display: none;">
						<?php echo $addons->lang['designer_api_user_login_error'] ?>
						<a href='<?php echo $site_url . 'index.php?route=account/forgotten' ?>' target='_blank'><?php echo $addons->lang['designer_api_user_login_forgotten']; ?></a>
					</p>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<button type="button" onclick="design.user.ini(this, 'login')" autocomplete="off" class="btn btn-default btn-primary" data-loading-text="Loading">
						<?php echo $addons->lang['designer_api_button_login'] ?>
					</button>
					 or
					<!--<a href="#f-register" onclick="jQuery('#f-login').modal('hide');" data-toggle="modal" data-target="#f-register"><strong>
						<?php echo $addons->lang['designer_api_button_register'] ?>
					</strong></a>
					-->
					<a href="<?php echo $site_url ?>index.php?route=account/register" target='_blank'>
						<strong><?php echo $addons->lang['designer_api_button_register'] ?></strong>
					</a>
				</div>
			</div>
		  </div>			 
		</div>
	  </div>	  
	</div>
	<!-- End Login -->

	<!-- Begin create account -->
	<div class="modal fade" id="f-register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div id="f-register-content" class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title"><?php echo $addons->lang['designer_api_form_register'] ?></h4>
		  </div>
		  <div class="modal-body">
			
			<div class="row">
				<!-- login form -->
				<div class="col-md-12">					
					<form id="fr-register" role="form" style="margin-bottom: 5px;">						  						 
					   <div class="form-group">
						<label><?php echo $addons->__('designer_api_user_your_email'); ?></label>
						<input type="text" id="register-email" class="form-control">
					  </div>
					  <div class="form-group">
						<label><?php echo $addons->__('designer_api_user_your_password'); ?></label>
						<input type="password" id="register-password" class="form-control">
					  </div>
					</form>
					<p class="text-muted"><?php echo $addons->lang['designer_api_user_register_desctiption'] ?></p>
					<p id="register-status" class="alert alert-danger" style="display: none;">
						<?php echo $addons->lang['designer_api_user_register_error_valid'] ?>
					</p>
					<p id="register-status-exist" class="alert alert-danger" style="display: none;">
						<?php echo $addons->lang['designer_api_user_register_error_exist'] ?>
					</p>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<button type="button" onclick="design.user.ini(this, 'register')" autocomplete="off" class="btn btn-default btn-primary" data-loading-text="Loading">
						<?php echo $addons->lang['designer_api_button_register'] ?>
					</button>
					 or
					<a href="#f-login" onclick="jQuery('#f-register').modal('hide');" data-toggle="modal" data-target="#f-login"><strong>
						<?php echo $addons->lang['designer_api_button_login'] ?>
					</strong></a>
				</div>
			</div>
		  </div>			 
		</div>
	  </div>	  
	</div>
	<!-- End create account -->
<?php } ?>