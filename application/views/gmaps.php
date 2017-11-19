	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		  <h1>
			<i class="fa fa-users"></i> Gmaps Management
			<small>Add, Edit, Delete</small>
		  </h1>
		</section>
		<section class="content">
			<div id="map"></div>
		</section>
		<section class="content">
			<div class="row">
				<div class="col-xs-12 text-right">
					<div class="form-group">
						<a class="btn btn-primary" href="<?php echo base_url(); ?>addNew"><i class="fa fa-plus"></i> Add New</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
				  <div class="box">
					<div class="box-header">
						<h3 class="box-title">Users List</h3>
						<div class="box-tools">
							<form action="<?php echo base_url() ?>userListing" method="POST" id="searchList">
								<div class="input-group">
								  <input type="text" name="searchText" value="<?php echo $searchText; ?>" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
								  <div class="input-group-btn">
									<button class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
								  </div>
								</div>
							</form>
						</div>
					</div><!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
					  <table class="table table-hover">
						<tr>
						  <th>Id</th>
						  <th>Name</th>
						  <th>Email</th>
						  <th>Mobile</th>
						  <th>Role</th>
						  <th class="text-center">Actions</th>
						</tr>
						<?php
						if(!empty($userRecords))
						{
							foreach($userRecords as $record)
							{
						?>
						<tr>
						  <td><?php echo $record->userId ?></td>
						  <td><?php echo $record->name ?></td>
						  <td><?php echo $record->email ?></td>
						  <td><?php echo $record->mobile ?></td>
						  <td><?php echo $record->role ?></td>
						  <td class="text-center">
							  <a class="btn btn-sm btn-info" href="<?php echo base_url().'editOld/'.$record->userId; ?>"><i class="fa fa-pencil"></i></a>
							  <a class="btn btn-sm btn-danger deleteUser" href="#" data-userid="<?php echo $record->userId; ?>"><i class="fa fa-trash"></i></a>
						  </td>
						</tr>
						<?php
							}
						}
						?>
					  </table>
					  
					</div><!-- /.box-body -->
					<div class="box-footer clearfix">
						<?php echo $this->pagination->create_links(); ?>
					</div>
				  </div><!-- /.box -->
				</div>
			</div>
		</section>
	</div>
	<script>
	  function initMap() {
        var uluru = {lat: -7.7697984, lng: 110.3758918};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: uluru
        });

        var contentString = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
            '<div id="bodyContent">'+
            '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
            'sandstone rock formation in the southern part of the '+
            'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
            'south west of the nearest large town, Alice Springs; 450&#160;km '+
            '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
            'features of the Uluru - Kata Tjuta National Park. Uluru is '+
            'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
            'Aboriginal people of the area. It has many springs, waterholes, '+
            'rock caves and ancient paintings. Uluru is listed as a World '+
            'Heritage Site.</p>'+
            '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
            'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
            '(last visited June 22, 2009).</p>'+
            '</div>'+
            '</div>';

        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });

        var marker = new google.maps.Marker({
          position: uluru,
          map: map,
          title: 'Uluru (Ayers Rock)'
        });
        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
      }
    </script>
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
