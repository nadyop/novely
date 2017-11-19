<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Novely</title>
	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/tether.min.css">
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/tether.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Cek Ongkir</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
        <li class="active"><a href="">Home <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Upload Twitter</a></li>
        <li><a href="#">Cek Ongkir</a></li>
        <li><a href="#">Cek Lokasi</a></li>
        <li><a href="#">Tentang Kami</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Daftar</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-success">
				  <div class="panel-heading">
				    <h3 class="panel-title">Pengiriman</h3>
				  </div>
				  <div class="panel-body">
				  <span> Asal Kota</span>
					<select class="form-control" name="origin" id="origin">
						<option value="" selected="" disabled="">Pilih Kota</option>
						<?php $this->load->view('rajaongkir/getCity'); ?>
					</select>
					<br>
					<span> Tujuan Kota</span>
					<select class="form-control" name="destination" id="destination">
						<option value="" selected="" disabled="">Pilih Kota</option>
						<?php $this->load->view('rajaongkir/getCity'); ?>
					</select>
					<br>
				  <Span>Berat Barang(gram) :
				    <input type="text" name="berat" placeholder="gram" id="berat" class="form-control">
				    <br>
					<span>Pilih Kurir</span>
				    <select class="form-control" name="courier" id="courier">
				    	<option value="">Pilih Kurir</option>
				    	<option value="jne">JNE</option>
				    	<option value="pos">POS</option>
				    	<option value="tiki">TIKI</option>
				    </select>
					<br>
				    <button type="button" onclick="tampil_data('data')" class="btn btn-info">Cek Ongkir</button>
				  </div>
				</div>
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
					              $("#hasil").html(ajaxData);
					          }
					      });
					  };
				</script>
			</div>

			<div class="col-md-8">
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
	</div>
</div>

<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/JQuery.min.js"></script>
</body>
</html>
