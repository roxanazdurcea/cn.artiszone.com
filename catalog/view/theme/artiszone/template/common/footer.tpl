<footer>
    <div class="container">
        <div class="row footer01Centered">
            <?php if ($informations) { ?>
            <div style="float: left; " class="colFooterwidth col-xs-3">
                <h4><?php echo $text_information; ?></h4>
                <ul class="list-unstyled">
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <?php } ?>
            <div style="float: left; " class="colFooterwidth col-xs-3">
                <h4><?php echo $text_service; ?></h4>
                <ul class="list-unstyled">
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                    <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                </ul>
            </div>
            <div style="float: left; " class="colFooterwidth col-xs-2">
                <h4><?php echo $text_extra; ?></h4>
                <ul class="list-unstyled">
                    <!--<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>-->
                    <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                    <!--<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>-->
                    <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                </ul>
            </div>
            <div style="float: left; " class="colFooterwidth col-xs-2">
                <h4><?php echo $text_account; ?></h4>
                <ul class="list-unstyled">
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                    <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                </ul>
            </div>
            <div style="float: left; " class="colFooterwidth col-xs-2">
                <a href="http://artisjet.com" target="_blank"><img class="img-responsive" src="image/catalog/artiszone-images/app/empowered.png"></a>
            </div>
        </div>
        <br>
        <!-- my added section -->
        <div class="row footer02Centered">    
            <div class='iconsWrapper flex-class'>  
                
             
                <a href="#"><img class="img-responsive" src="image/catalog/artiszone-images/app/facebook.png"
                                 onmouseover="this.src='image/catalog/artiszone-images/app/facebook-hover.png';"
                                 onmouseout="this.src='image/catalog/artiszone-images/app/facebook.png';" /></a>&nbsp;
                <a href="#"><img class="img-responsive" src="image/catalog/artiszone-images/app/twitter.png"
                                 onmouseover="this.src='image/catalog/artiszone-images/app/twitter-hover.png';"
                                 onmouseout="this.src='image/catalog/artiszone-images/app/twitter.png';" /></a>&nbsp;
                <a href="#"><img class="img-responsive" src="image/catalog/artiszone-images/app/pinterest.png"
                                 onmouseover="this.src='image/catalog/artiszone-images/app/pinterest-hover.png';"
                                 onmouseout="this.src='image/catalog/artiszone-images/app/pinterest.png';"/></a>&nbsp;
                <a href="#"><img class="img-responsive" src="image/catalog/artiszone-images/app/linkedin.png"
                                 onmouseover="this.src='image/catalog/artiszone-images/app/linkedin-hover.png';"
                                 onmouseout="this.src='image/artiszone-images/app/linkedin.png';"/></a>&nbsp;
                <a href="#"><img class="img-responsive" src="image/catalog/artiszone-images/app/youtube.png"
                                 onmouseover="this.src='image/catalog/artiszone-images/app/youtube-hover.png';"
                                 onmouseout="this.src='image/catalog/artiszone-images/app/youtube.png';"/></a>&nbsp;
                <a href="#"><img class="img-responsive" src="image/catalog/artiszone-images/app/instagram.png"
                                 onmouseover="this.src='image/catalog/artiszone-images/app/instagram-hover.png';"
                                 onmouseout="this.src='image/catalog/artiszone-images/app/instagram.png';"/></a>&nbsp;
            </div>                
        </div>
    </div>
    <img style="width: 100%; height: auto;" class="img-responsive" src="image/catalog/artiszone-images/app/bara.png" />
    <br>
    <div class="row" style="margin-left: 0px; margin-right: 0px;">       
        <div style="text-align: center; color: #949292;" class="col-md-12">Copyright <?php echo date("Y"); ?>, BMBC Premium Solutions</div>
    </div> 
    <br>
    <!-- end of my added section -->
</footer>
</body>
</html>