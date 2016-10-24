<?php foreach ($products as $product) { ?>
      <tr <?php echo ($product['blongs_to_store'] == 0 ? "class='warning'" : "") ?> >
        <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?>
          <?php if($product['recurring']) { ?>
          <br />
          <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
          <?php } ?>
          <br />
          <span style="font-size:10px;">
          <?php echo $text_product_store; ?>
          <?php foreach($product['stores_list'] as $store){ 
                 echo '&nbsp'. $store['name'];
           } 
           ?>
           </span>
        </td>
        <td class="text-left"><?php  echo $product['model']; ?></td>
        <td class="text-right"><?php echo $product['quantity']; ?></td>
        <td class="text-right"><?php echo $product['price']; ?></td>
        <td class="text-right"><?php echo $product['total']; ?></td>
        <?php
        if($product['blongs_to_store'] == 0){ 
        ?>
        <td class="text-right"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="removeCart('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
        <?php }else{ ?>
        <td class="text-right"></td>
        <?php } ?> 
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="text-left"><?php echo $voucher['description']; ?></td>
        <td class="text-left"></td>
        <td class="text-right">1</td>
        <td class="text-right"><?php echo $voucher['amount']; ?></td>
        <td class="text-right"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="4" class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
        <td class="text-right"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  
  </table>
  <div class="buttons clearfix">
    <div class="pull-right">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-confirm-order" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
    </div>
  </div>      
</div>

<?php }