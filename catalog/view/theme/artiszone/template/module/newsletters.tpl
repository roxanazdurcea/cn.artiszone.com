<script>
    function subscribe()
    {
        var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var email = $('#txtemail').val();
        var email2 = $('#txtemail2').val();
        email = (email === "") ? email2 : email;
        if (email !== "")
        {
            if (!emailpattern.test(email))
            {
                alert("Invalid Email");
                return false;
            }
            else
            {
                $.ajax({
                    url: 'index.php?route=module/newsletters/news',
                    type: 'post',
                    data: 'email=' + email,
                    dataType: 'json',
                    success: function (json) {
                        $('#memberModal').hide(); //hide registration modal
                        localStorage.setItem("newsRegister", "true"); //save to local variable
                        swal("Congratulations!", "You have registered " + email + " to artiszone newsletter!", "success"); //popup sweet alert
                    }
                });
                return false;
            }
        }
        else
        {
            alert("Email Is Require");
            $(email).focus();
            return false;
        }
    }
</script>


<!-- <h2><?php echo $heading_title; ?></h2> -->

<div class="container-fluid">
    <div style="width: 100%; background-image: url('http://artiszone.com/image/catalog/artiszone-images/homepage-banners/background-newsletter.png');">
        <div class="container">
            <div class="row" style="margin:2%;">
                <h3 class="col-sm-5 text-center text-right" style="color: #fff;"><?php echo $text_updates; ?></h3>
                <form action="" method="post">
                    <div class="form-group required">
                        <!--<label class="col-sm-2 control-label" for="input-firstname">Email:</label>-->
                        <div class="col-sm-5 col-xs-8" style=" padding-right: 0px;">
                            <input style="border-radius: 0px; height: 45px; background: rgba(255, 255, 255, .5); border: 1px solid #000;" type="email" name="txtemail" id="txtemail" value="" placeholder="<?php echo $text_placeholder; ?>" class="form-control"  />
                        </div>
                    </div>
                    <div class="form-group required">
                        <!--<label class="col-sm-2 control-label" for="input-firstname">Email:</label>-->
                        <div class="col-sm-2 col-xs-4" style=" padding-left: 0px;">
                            <button style="background: rgba(255, 255, 255, .5); border: 1px solid #000; color: #000; font-weight: 700; height: 45px;     width: 100%;" type="submit" class="btn btn-default btn-lg" onclick="return subscribe();"><?php echo $text_join; ?></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>