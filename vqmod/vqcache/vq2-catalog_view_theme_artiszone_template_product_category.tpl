<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>

    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <br>
            <!-- <h2 class="center">Featured Categories</h2>
            <div class="row">
                <div class="col-sm-6"><a href=""><img src="http://artismedias.com/image/catalog/Featured-Indoor-coaster.jpg" class="img-responsive center-block"></a></div>
                <div class="col-sm-6"><a href=""><img src="http://artismedias.com/image/catalog/Featured-Stationary-mousepad.jpg" class="img-responsive center-block"></a></div>
            </div> -->
            <!-- <h2><?php echo $heading_title; ?></h2> -->
            
            <!--<?php if ($thumb || $description) { ?>
            <div class="row">
                <?php if ($thumb) { ?>
                <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <?php if ($description) { ?>
                <div class="col-sm-10"><?php echo $description; ?></div>
                <?php } ?>
            </div>
            <?php } ?> -->
            

            <?php if ($products) { ?>
            <!-- <br>
            <p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
            <br> -->
            <div class="row">
                <div class="col-md-4">
                    <div class="hidden-xs">
                        <button style="background-color: #4e4e4e;" type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                        <button style="background-color: #4e4e4e;" type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                    </div>
                </div>
                <div class="col-md-2 text-right">
                    <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
                </div>
                <div class="col-md-3 text-right">
                    <select id="input-sort" class="form-control" onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </div>
                <div class="col-md-1 text-right">
                    <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
                </div>
                <div class="col-md-2 text-right">
                    <select id="input-limit" class="form-control" onchange="location = this.value;">
                        <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </div>
            </div>
            
            <br />
            <div class="row flex-class">
                <?php foreach ($products as $product) { ?>
                <div class="product-layout product-list col-xs-12">
                    <div class="product-thumb">
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

                        <div>
                            <div class="caption">
                                <div class="rating center">
                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                    <?php if ($product['rating'] < $i) { ?>
                                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                    <?php } else { ?>
                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                                <!--<h4 class="center"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4> -->
                                <h4 class="center"><a href="<?php echo $product['href']; ?>"><?php echo substr($product['name'], 0, 38) . ".."; ?></a></h4>
                            
                                <!--<p><?php echo $product['description']; ?></p> -->                               
                                <?php if ($product['price']) { ?>
                                <p class="price center">
                                    <?php if (!$product['special']) { ?>
                                    <?php echo $product['price']; ?>
                                    <?php } else { ?>
                                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                    <?php } ?>
                                    <!-- <?php if ($product['tax']) { ?>
                                    <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span> 
                                    <?php } ?> -->
                                </p>
                                <?php } ?>
                            </div>
                            <div class="button-group" style="position: absolute; top: 35%; width: 90%; left:5%; right:5%;">
                                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-plus" aria-hidden="true"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                            </div>
                        </div>

                    </div>
                </div>
                <?php } ?>
            </div>
            <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
            <?php } ?>
            <?php if (!$categories && !$products) { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>