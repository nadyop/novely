	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content">
			<div id="map"></div>
		</section>
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
				  <div class="box">
					<div class="box-header">
						<h3 class="box-title">Users List</h3>
						<!--<div class="box-tools">
							<form action="<?php echo base_url() ?>userListing" method="POST" id="searchList">
								<div class="input-group">
								  <input type="text" name="searchText" value="<?php echo $searchText; ?>" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
								  <div class="input-group-btn">
									<button class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
								  </div>
								</div>
							</form>
						</div>-->
					</div><!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
					  <table class="table table-hover">
						<tr>
						  <th>No</th>
						  <th>Nama</th>
						  <th>Email</th>
						  <th>Nomor Telepon</th>
						  <th>Alamat</th>
						  <th>Provinsi</th>
						  <th>Kota</th>
						  <th>Kode Pos</th>
						</tr>
						<?php
						if(!empty($userRecords))
						{
							foreach($userRecords as $record)
							{
						?>
						<tr>
						  <td><?php echo $record->id_pembeli ?></td>
						  <td><?php echo $record->nama_pembeli ?></td>
						  <td><?php echo $record->email_pembeli ?></td>
						  <td><?php echo $record->telepon_pembeli ?></td>
						  <td><?php echo $record->alamat_pembeli ?></td>
						  <td><?php echo $record->provinsi ?></td>
						  <td><?php echo $record->kota ?></td>
						  <td><?php echo $record->kode_pos ?></td>
						</tr>
						<?php
							}
						}
						?>
					  </table>
					  
					</div><!-- /.box-body -->
					<!--<div class="box-footer clearfix">
						<?php echo $this->pagination->create_links(); ?>
					</div>-->
				  </div><!-- /.box -->
				</div>
			</div>
		</section>
	</div>
	<script>
		var map;
			
		function initMap() {
			var uluru = {lat: -0.531462, lng: 110.917004};
			var map = new google.maps.Map(document.getElementById('map'), {
			  zoom: 5,
			  center: uluru
			});

			var contentString = '<div id="content">'+
				'<div id="siteNotice">'+
				'</div>'+
				'<center><img src="<?php echo base_url();?>assets/images/logo.png" style="max-width: 190px;"></center>'+
				'</div>';

			var infowindow = new google.maps.InfoWindow({
				content: contentString
			});

			// var marker = new google.maps.Marker({
				// position: uluru,
				// map: map,
				// title: 'Yogyakarta'
			// });
			
			var features = [
				{ 	
					position: new google.maps.LatLng(-7.774531, 110.374573)
				}, //{ position: new google.maps.LatLng(-7.773874, 110.375200) },
				<?php
					if(!empty($userRecords))
					{
						foreach($userRecords as $record)
						{
				?>
					{ 
						position: new google.maps.LatLng(<?php echo $record->longitude; ?>, <?php echo $record->latittude; ?>)
					},
				<?php	
						}
					}
				?>
			];
			
			for (var i = 0, feature; feature = features[i]; i++) {
				addMarker(feature);
			}
			
			// for (var i = 0, content; content = contents[i]; i++) {
				// addContent(content);
			// }
			
			// function addContent(content) {
				// var infowindow = new google.maps.InfoWindow({
					// content: content.contentString
				// });
			// }
			
			function addMarker(feature) {
				var marker = new google.maps.Marker({
					position: feature.position,
					map: map
				});	
				
				marker.addListener('click', function() {
					infowindow.open(map, marker);
				});	
			}
			
		}
    </script>
    
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAJG3_3_IixlWYdFd2bH4gfI0CNbW93IrU&callback=initMap"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/common.js" charset="utf-8"></script>
	<script type="text/javascript">
		jQuery(document).ready(function(){
        jQuery('ul.pagination li a').click(function (e) {
            e.preventDefault();            
            var link = jQuery(this).get(0).href;            
            var value = link.substring(link.lastIndexOf('/') + 1);
            jQuery("#searchList").attr("action", baseURL + "userListing/" + value);
            jQuery("#searchList").submit();
        });
    });
</script>
