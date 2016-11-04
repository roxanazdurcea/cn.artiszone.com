<div class="hidden-xs" id="cookieConsent" style="width:100%; height :60px; display:none; background-color: #383838;">
    <div class="container">
        <div class="row" style="margin-top: 10px;">
            <div class="col-sm-10">
                <p style="color: #fff;">We use cookies to ensure that we give you the best experience on our website. 
                    By pressing Accept, we'll assume that you are happy to receive cookies on the artiszone website. 
                    By pressing Cancel we will not save any information about your activity on our website. </p>
            </div>
            <div class="col-sm-2" style="margin-top: 5px;">
                <button style="background-color: #fff;" type="button" class="btn btn-responsive" id ="cookieCancel">Cancel</button>
                <button style="background-color: #fff;" type="button" class="btn btn-responsive" id ="cookieAccept">Accept</button>
            </div>
        </div>
    </div>
</div>


<?php echo $header; ?>
<!-- <img src="image/catalog/slideshow-homepage/phonecase.png" style="width: 100%;"> -->


<div class="container-fluid">
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" style="padding-right:0px; padding-left: 0px;" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>












<!-- Modal -->
<div class="modal fade" id="memberModal" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-image: url('image/catalog/newsletter-modal-background.jpg')">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times" aria-hidden="true"></i></span></button>             
            </div>
            <div class="modal-body">
                <div style='background-color: #fff;'>

                    <div style='height:400px;'>
                        <div style='padding: 10%'>
                            <h1 style='text-align: center;'><?php echo $text_want; ?></h1>
                            <p style='text-align: center;'><?php echo $text_update; ?><br><?php echo $text_collections; ?></p>
                            <hr>
                            <h3 style='text-align: center;'><?php echo $text_subscribe; ?></h3>
                            <form action="" method="post">
                                <div class="form-group required">
                                    <!--<label class="col-sm-2 control-label" for="input-firstname">Email:</label>-->
                                    <div class="col-sm-10 col-xs-12" style=" padding-right: 0px; margin-bottom: 5px; padding-left: 0px">
                                        <input style="border-radius: 0px; height: 45px; background: rgba(255, 255, 255, .5); border: 1px solid #000;" type="email" name="txtemail2" id="txtemail2" value="" placeholder="<?php echo $text_placeholder; ?>" class="form-control"  />
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <!--<label class="col-sm-2 control-label" for="input-firstname">Email:</label>-->
                                    <div class="col-sm-2 col-xs-offset-4 col-xs-4" style=" padding-left: 0px; margin-left: 0px;">
                                        <button style="background: rgba(255, 255, 255, .5); border: 1px solid #000; color: #000; font-weight: 700; height: 45px;" type="submit" class="btn btn-default btn-lg" onclick="return subscribe();"><?php echo $text_join; ?></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <!-- <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button> 
             </div> -->
        </div>
    </div>
</div>
<!-- End of Modal -->











<script src="catalog/view/javascript/home.js" type="text/javascript"></script>
<?php echo $footer; ?>


<script>
    $(document).ready(function () {
        var lang = $('HTML').attr('lang');
            if (lang === "en") {
                $('#slideshow0').css('display','block');
                $('#slideshow1').css('display','none');
            }
            else {
                $('#slideshow0').css('display','none');
                $('#slideshow1').css('display','block');
            }

    });
</script>