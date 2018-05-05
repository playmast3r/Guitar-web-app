<?php
require "config.php";

$sql = "SELECT * FROM ProductList WHERE inventoryReceived - inventoryShipped > 0 LIMIT 20;";

if($search) {
	// To protect MySQL injection since I have not used any ORM
	$search = mysqli_real_escape_string($db, $search);
	$sql = "SELECT * FROM ProductList WHERE inventoryReceived - inventoryShipped > 0 AND (brand LIKE '%$search%' OR model LIKE '%$search%' OR type LIKE '%$search%') LIMIT 20;";
}
$result = mysqli_query($db, $sql);
?>

<!-- top-brands -->
<div class="top-brands">
		<div class="container">
			<h3>Browse Guitars</h3>
			<div class="agile_top_brands_grids">
<?php
if(mysqli_num_rows($result) == 0) {
	echo "<h4><span>No results found.</span></h4>";
}
while($row = mysqli_fetch_assoc($result)) {
	$title = $row["brand"] . " " . $row["model"] . " - " . $row["type"];
	$price = $row["price"];
	$i = rand(1, 4);
?>
				<div class="col-md-3 top_brand_left">
					<div class="hover14 column">
						<div class="agile_top_brand_left_grid">
							<div class="agile_top_brand_left_grid1">
								<figure>
									<div class="snipcart-item block" >
										<div class="snipcart-thumb">
											<a href="#"><img title=" " alt=" " class="img-responsive" src="images/product<?= $i ?>.jpg" /></a>
											<p><?= $title ?></p>
											<h4>₹ <?= $price ?></h4>
										</div>
										<div class="snipcart-details top_brand_home_details">
											<form action="#" method="post">
												<fieldset>
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" />
													<input type="hidden" name="business" value=" " />
													<input type="hidden" name="item_name" value="<?= $title ?>" />
													<input type="hidden" name="amount" value="<?= $price ?>" />
													<input type="hidden" name="discount_amount" value="0" />
													<input type="hidden" name="currency_code" value="INR" />
													<input type="hidden" name="return" value=" " />
													<input type="hidden" name="cancel_return" value=" " />
													<input type="submit" name="submit" value="Add to cart" class="button" />
												</fieldset>
											</form>
										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>
<?php
}
?>
				<div class="clearfix"> </div>
<!-- //top-brands -->
			</div>
		</div>
	</div>
</div>
