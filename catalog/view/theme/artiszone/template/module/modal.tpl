<?php if ($modules) { ?>

<div id="modal<?php echo $mod; ?>" >

    <!-- Button HTML (to Trigger Modal) -->
    <?php echo $button; ?>
    <br/>
    <div class="modal fade" id="modalx<?php echo $uniqid; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog <?php echo $size; ?> ">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="container-fluid">
                        <div class="row">
                            <p>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">&star;  &star;</h4>
                            </p>
                            <?php echo isset($modules['top']) ? $modules['top'] : "" ; ?>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <?php echo isset($modules['body']) ? $modules['body'] : "" ; ?>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="container-fluid">
                        <div class="row">
                            <?php echo isset($modules['footer']) ? $modules['footer'] : "" ; ?>
                        </div>
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">[X] </button>
                </div>
            </div>
        </div>
    </div>

</div>


<script type="text/javascript"><!--

    < ?php echo $js; ? >
//--></script>
<?php } ?>
