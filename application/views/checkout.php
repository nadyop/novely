
<div class="wrapper">
	<div class="container">
		<div class="row">
			<div class="row">
				<div class="col-md-12">
					<h3 class="title-6 margin-bottom-50">Billing Details</h3>
				</div>
			</div>
			<div class="coupon-area">
				<div class="row">
					<div class="col-md-12">
						<div class="coupon-accordion">
							<!-- ACCORDION START -->
							<h3>Please fill in the blank</h3>
							<div id="checkout_coupon" class="coupon-checkout-content">
								<div class="coupon-info">
									<form action="#">
										<p class="checkout-coupon">
											<input type="text" placeholder="Coupon code" />
											<input type="submit" value="Apply Coupon" />
										</p>
									</form>
								</div>
							</div>
							<!-- ACCORDION END -->
						</div>
					</div>
				</div>
			</div>
			<div class="checkout-bill-order">
				<form action="#" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="checkout-bill">
							</div>
							<div class="row coupon-info">
								<div class="col-md-12">
									<p class="form-row-first">
										<label>Full Name [Recipient] </label>
										<input type="text" />
									</p>
								</div>
							</div>
							<div class="row coupon-info">
								<div class="col-md-6">
									<p class="form-row-first">
										<label>Email Address <span class="required">*</span></label>
										<input type="text" />
									</p>
								</div>
								<div class="col-md-6">
									<p class="form-row-last">
										<label>Phone  <span class="required">*</span></label>
										<input type="text" />
									</p>
								</div>
							</div>
							<div class="row coupon-info">
								<div class="col-md-12">
									<p class="form-row-first">
										<label>Province</label>
										<select class="custom-select custom-form" name="propinsi_asal" id="propinsi_asal">
											<option value="" selected="" disabled="">Pilih Provinsi</option>
											<?php $this->load->view('rajaongkir/getProvince'); ?>
										</select>
									</p>
								</div>
							</div>
							<div class="row coupon-info">
								<div class="col-md-6">
									<p class="form-row-first">
										<label>City</label>
										<select class="custom-select custom-form" name="origin" id="origin">
											<option value="" selected="" disabled="">Pilih Kota</option>
										</select>
									</p>
								</div>
								<div class="col-md-6">
									<p class="form-row-last">
										<label>Zip</label>
										<input type="text" />
									</p>
								</div>
							</div>
							<div class="row coupon-info">
								<div class="col-md-12">
									<p class="form-row-first">
										<label>Address</label>
										<input type="text" placeholder="Street address" />
									</p>
								</div>
							</div>
							<div class="row coupon-info">
								<div class="col-md-12">
									<p class="form-row-first">
										<label>Province Destination</label>
										<select class="custom-select custom-form" name="propinsi_tujuan" id="propinsi_tujuan">
											<option value="" selected="" disabled="">Choose Province</option>
											<?php $this->load->view('rajaongkir/getProvince'); ?>
										</select>
									</p>
								</div>
							</div>
							<div class="row coupon-info">
								<div class="col-md-6">
									<p class="form-row-first">
										<label>City Destination</label>
										<select class="custom-select custom-form" name="destination" id="destination">
											<option value="" selected="" disabled="">Choose City</option>
										</select>
									</p>
								</div>
								<div class="col-md-6">
									<p class="form-row-last">
										<label>Zip</label>
										<input type="text" />
									</p>
								</div>
							</div>
							<div class="row coupon-info">
								<div class="col-md-6">
									<p class="form-row-first">
										<label>Courier</label>
										<!-- <input type="text"/> -->
										<select class="custom-select custom-form" name="courier" id="courier">
											<option value="">Pilih Kurir</option>
											<option value="jne">JNE</option>
											<option value="pos">POS</option>
											<option value="tiki">TIKI</option>
										</select>
									</p>
								</div>
								<div class="col-md-6">
									<p class="form-row-first">
										<label>Weight</label>
										<input type="text" name="berat" placeholder="gram" id="berat" class="form-control">
									</p>
								</div>
							</div>
							<!-- button check -->
							<div class="row coupon-info">
								<div class="col-md-12">
									<p class="form-row">
										<button type="button" onclick="tampil_data('data')" class="btn btn-info">Cek Ongkir</button>
									</p>
								</div>
							</div>
						</div>
						<!-- right side -->
						<div class="col-md-6">
							<div class="panel panel-success">
							  <div class="panel-heading">
							    <h3 class="panel-title">Hasil</h3>
							  </div>
							  <div class="panel-body">
							  	<ol>
								    <div id="hasil">

								    </div>
							    </ol>
							  </div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<script>
					function tampil_data(act){
					      var w = $('#origin').val();
					      var x = $('#destination').val();
					      var y = $('#berat').val();
					      var z = $('#courier').val();

					      $.ajax({
					          url: "rajaongkir/getCost",
					          type: "GET",
					          data : {origin: w, destination: x, berat: y, courier: z},
					          success: function (ajaxData){
					              //$('#tombol_export').show();
					              //$('#hasilReport').show();
					              $("#hasil").html(ajaxData);
					          }
					      });
					  };
				</script>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/JQuery.min.js"></script>

<script>
$(document).ready(function(){

	$("#propinsi_asal").click(function(){
		$.post("<?php echo base_url(); ?>index.php/rajaongkir/getCity/"+$('#propinsi_asal').val(),function(obj){
			$('#origin').html(obj);
		});

	});

	$("#propinsi_tujuan").click(function(){
		$.post("<?php echo base_url(); ?>index.php/rajaongkir/getCity/"+$('#propinsi_tujuan').val(),function(obj){
			$('#destination').html(obj);
		});
	});
});
</script>
