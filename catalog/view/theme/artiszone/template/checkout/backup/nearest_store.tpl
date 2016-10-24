<form class="form-horizontal">
  <?php if ($stores) { ?>
     <?php foreach ($stores as $store) { ?>
  <div class="radio">
    <label>
        <input type="radio" name="payment_store" value="<?php echo $store['store_id'] ?>"  />
      <?php echo $store['name'] ?>
      (<?php echo $store['address']; ?>)
    </label>
  </div>
   
     <?php } ?>
  <div class="buttons clearfix">
    <div class="pull-right">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-choose-store" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
    </div>
  </div>       
  <?php }else{ ?>
  <div><?php echo $text_no_store_available; ?></div>
  
  <?php } ?>

</form>

