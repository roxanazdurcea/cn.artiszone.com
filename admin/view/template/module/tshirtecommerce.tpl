<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">     
      <h1><?php echo $heading_title; ?> - Settings</h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  
	<?php if (isset($error_warning)) { ?>
	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
	
	<?php if (isset($success)) { ?>
	<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
	
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">	
		<form action="<?php echo $link; ?>" method="post" id="form-attribute">
			<div class="form-group">
				<div class="col-md-12">
					<label>Product default</label>
				</div>
				<div class="col-md-12">
					<?php if ($products == 0) { ?>
					Please add product design.
					<?php } else { ?>
					
					<select name="tshirtecommerce_product" class="form-control">
					<?php 
						foreach($products as $product) {
							if ($product_id == $product['product_id'])
								$select = 'selected="selected"';
							else
								$select = '';
					?>
						<option <?php echo $select; ?> value="<?php echo $product['product_id']; ?>"><?php echo $product['name']; ?></option>
					<?php } ?>
					</select>
					
					<?php } ?>
				</div>				
				<div class="col-md-10">
					<p class="text-muted">Choose product default. It is very important. This product will show in designer.</p>
				</div>
			</div>
			
			<div class='col-md-12 form-group'>
				<label for='design_downloadable'>
					<span style='padding-right:15px;' data-toggle="tooltip" data-placement="right" title="Allow clients to download design on order history and e-mail payments">Downloadable design</span>
					<input type='checkbox' value='1' name='tshirtecommerce_downloadable' id='tshirtecommerce_downloadable' <?php if(isset($tshirtecommerce_downloadable) && $tshirtecommerce_downloadable == 1) echo 'checked' ?> />
				</label>
			</div>
			<div class="col-md-2 form-group">
				<button type="submit" class="btn btn-primary">Save</button>
			</div>				

		</form>		
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>