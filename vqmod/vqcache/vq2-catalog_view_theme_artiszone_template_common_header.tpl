<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
        <script src="catalog/view/javascript/jquery/jquery.msgBox.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
        <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="catalog/view/theme/artiszone/stylesheet/sweet-alert.css" rel="stylesheet" type="text/css"/>
        <script src="catalog/view/javascript/sweet-alert.min.js" type="text/javascript"></script>
        <!--<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,700" rel="stylesheet" type="text/css">
        <!--<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">-->
        <link href="catalog/view/theme/artiszone/stylesheet/stylesheet.css" rel="stylesheet">

<!-- Menu3rdLevel >>> -->
			<link rel="stylesheet" type="text/css" href="catalog/view/theme/artiszone/stylesheet/menu3rdlevel/menu3rdlevel.css" />
<!-- <<< Menu3rdLevel -->
      
        <link href="catalog/view/theme/artiszone/stylesheet/msgBoxLight.css" rel="stylesheet" type="text/css"/>
        <!-- google API-->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgHRdN7QP2sQ2LWLFQpNnRdvgIpoSxpPg&sensor=false"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazyload/1.9.1/jquery.lazyload.js"></script> 

        <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        
<!-- Menu3rdLevel >>> -->
			<script type="text/javascript" src="catalog/view/javascript/menu3rdlevel/common.js"></script>
<!-- <<< Menu3rdLevel -->
      
        <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
        <?php } ?>
        <?php echo $google_analytics; ?>
    </head>
    <body class="<?php echo $class; ?>" >
        <nav id="top">
            <div class="container" style="background-color: white;">
                <?php echo $currency; ?>
                <?php echo $language; ?>
                <div id="top-links" class="nav pull-right">
                    <ul class="list-inline">
                        <!--<li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>-->
                        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><span class="hidden-xs hidden-sm hidden-md uppercase-text"><?php echo $text_account; ?></span> <span class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <?php if ($logged) { ?>
                                <li><a  href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                <?php } else { ?>
                                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                <?php } ?>
                            </ul>
                        </li>
                        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"  title="<?php echo $text_wishlist; ?>"><span class="hidden-xs hidden-sm hidden-md uppercase-text"><?php echo $text_wishlist; ?></span></a></li>
                        <li><a href="<?php echo $shopping_cart; ?>"                 title="<?php echo $text_shopping_cart; ?>"><span class="hidden-xs hidden-sm hidden-md uppercase-text"><?php echo $text_shopping_cart; ?></span></a></li>
                        <li><a href="<?php echo $checkout; ?>"                      title="<?php echo $text_checkout; ?>"><span class="hidden-xs hidden-sm hidden-md uppercase-text"><?php echo $text_checkout; ?></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <img style="width: 100%; height: auto;" class="img-responsive" src="http://artiszone.com/image/catalog/artiszone-images/app/bara.png" />
        <header>
            <div class="container" style="background-color: white;">
                <div class="row center-block" style="padding-top: 1%;">
                    <div class="col-md-6 col-sm-5 col-xs-12">
                        <div id="logo">
                            <?php if ($logo) { ?>
                            <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                            <?php } else { ?>
                            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-6"><?php echo $search; ?>
                    </div>
                    <div class="col-md-2 col-sm-3 col-xs-6"><?php echo $cart; ?></div> 
                </div>
            </div>
        </header>
        <?php if ($categories) { ?>
        <div class="container" style="background-color: white;">
            <nav id="menu" class="navbar center-block">
                <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <!--my menu-->      
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Make</a>
                            <div class="dropdown-menu">
                                <div class="dropdown-inner">              
                                    <ul class="list-unstyled">              
                                        <li><a href="http://artiszone.com/index.php?route=information/information&information_id=7">Mobile Devices</a></li> 
                                        <li><a href="http://artiszone.com/index.php?route=information/information&information_id=8">T-shirts</a></li>  
                                        <li><a href="http://artiszone.com/index.php?route=information/information&information_id=9">Giveaways</a></li> 
                                    </ul>           
                                </div>
                            </div>
                        </li> 
                        <!--end of my menu-->
                        <?php foreach ($categories as $category) { ?>
                        <?php if ($category['children']) { ?>
                        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                            <div class="dropdown-menu">
                                <div class="dropdown-inner">
                                    <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                    <ul class="list-unstyled">
                                        <?php foreach ($children as $child) { ?>
                                        
<?php // Menu3rdLevel >>> ?>
					<?php // isset check to work with another ext ?>
					<?php if (isset($child['children_lv3']) && $child['children_lv3']) { ?>
                		<li><a class="arrow" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                        	<div class="menu3rdlevel">
            					<div class="menu3rdlevel_inner">
              						<?php foreach (array_chunk($child['children_lv3'], ceil(count($child['children_lv3']) / $child['column'])) as $children_lv3) { ?>
              							<ul class="list-unstyled">
                							<?php foreach ($children_lv3 as $child_lv3) { ?>
                                            	<li><a href="<?php echo $child_lv3['href']; ?>"><?php echo $child_lv3['name']; ?></a></li>
                        					<?php } ?>
                                       	</ul>
                                 	<?php } ?>
                           		</div>
                                <a href="<?php echo $child['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $child['name']; ?></a>
                           	</div>
                        </li>
                   	<?php } else { ?>
                    	<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                  	<?php } ?>
<?php // <<<Menu3rdLevel ?>
      
                                        <?php } ?>
                                    </ul>
                                    <?php } ?>
                                </div>
                                <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
                        </li>
                        <?php } else { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
            </nav>
        </div>
        <img style="width: 100%; height: auto;" class="img-responsive" src="http://artiszone.com/image/catalog/artiszone-images/app/bara.png" />
        <?php } ?>
     

        <script src="catalog/view/javascript/main.js" type="text/javascript"></script>
