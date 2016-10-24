
<div class="list-group">
  <?php foreach ($categories as $category_1) { ?>
  <?php if ($category_1['category_id'] == $category_id) { ?>
  <a href="<?php echo $category_1['href']; ?>" class="list-group-item active"><?php echo $category_1['name']; ?></a>
  <?php if ($category_1['children']) { ?>
  <?php foreach ($category_1['children'] as $category_2) { ?>
  <?php if ($category_2['category_id'] == $child_id) { ?>
  <a href="<?php echo $category_2['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $category_2['name']; ?></a>
  <?php if ($category_2['children']) { ?>
    <?php foreach ($category_2['children'] as $category_3) { ?>
	<?php if ($category_3['category_id'] == $subchild_id) { ?>
    <a href="<?php echo $category_3['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <?php echo $category_3['name']; ?></a>
	<?php } else { ?>
	<a href="<?php echo $category_3['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <?php echo $category_3['name']; ?></a>
	<?php } ?>
    <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category_2['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $category_2['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category_1['href']; ?>" class="list-group-item"><?php echo $category_1['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>
		

















