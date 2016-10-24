<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="radio">
  <label>
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
    <?php echo $payment_method['title']; ?>
    <?php if ($payment_method['terms']) { ?>
    (<?php echo $payment_method['terms']; ?>)
    <?php } ?>
  </label>
</div>
<?php } ?>
<?php } ?>
<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<?php if ($text_agree) { ?>

<div id="coupon">
  <b><?php echo $entry_payment_coupon; ?></b><br /><br />
  <?php echo $text_payment_coupon; ?>&nbsp;
  <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
  &nbsp;<input type="button" id="button-coupon" class="btn btn-primary" value="<?php echo $button_coupon; ?>" />
</div><br/>
			
<div class="buttons">
  <div class="pull-right"><?php echo $text_agree; ?>
    <?php if ($agree) { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="agree" value="1" />
    <?php } ?>
    &nbsp;
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<?php } ?>

<script type="text/javascript"><!--
$('#button-coupon').bind('click', function() {
	$.ajax({
		type: 'POST',
		//url: 'index.php?route=total/coupon/coupon',
		url: 'index.php?route=checkout/checkout/checkout_coupon',
		data: $('#coupon :input'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').attr('disabled', true);
			$('#checkout-coupon-loading').remove();
			$('#button-coupon').after(' <i id="checkout-coupon-loading" class="fa fa-spinner fa-spin"></i>');
		},
		complete: function() {
			$('#button-coupon').attr('disabled', false);
			$('#checkout-coupon-loading').remove();
		},
		success: function(json) {
			if (json['error']) {
				alert( json['error'] );
			} else {
				//$("input[name=coupon]").val("");
				alert( "<?php echo $text_payment_coupon_success; ?>" );
			}
		}
	});
});
//--></script>
			