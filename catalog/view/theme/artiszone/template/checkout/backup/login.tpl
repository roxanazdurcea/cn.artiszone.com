<div class="row">
  <div class="col-sm-6">
    <!-- google map -->
    <div style="margin:5px; border-radius: 5px; width:850px; height:470px;" id="google-map-display"></div>
    <input type="hidden" name="client_latitude" id="client_latitude"  />
    <input type="hidden" name="client_longitude" id="client_longitude" />
    <input type="button" value="<?php echo $button_continue; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript">
    
    
var lati,longi;
var geocoder;
var myCenter, map, marker;


$(document).ready(function(){
   /*-- show current location -- */
   
        init_map();
});
function init_map() {
   // alert("activate geo location");
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } 
    
    navigator.geolocation.watchPosition(function(position) {
      console.log("i'm tracking you!");
    },
    function (error) { 
        $.msgBox({
        title: "Ooops",
        content: "Turn on your browser location in order to find you apropiate stores!",
        type: "error",
        buttons: [{ value: "Ok" }]
        });
    });    
}
    function showPosition(position) {
         
        initialize_map(position.coords.latitude,position.coords.longitude);
    }
/*    function handle_error(err) {

      if (err.code == 1) {
          alert('activ geo location');
      }
    } */

function initialize_map(lati_map,longi_map) {
    
        
    $('#client_latitude').val(lati_map);
    $('#client_longitude').val(longi_map);
    
    var client_array = ['your location', lati_map, longi_map,1];
    $.ajax({
        url: 'index.php?route=checkout/login/getNearestStores',
        type: 'post',
        data: {'client_latitude':lati_map,'client_longitude':longi_map},
        dataType: 'json',
        success: function(response) {
           var loc_array = [];
           var arr = [];
           var $i = 2;
            $.each(response, function(index, value){
                
                    arr =[value.name, value.latitude, value.longitude,$i];

                    loc_array.push(arr);
                    
                    $i++;

            });
                    loc_array.push(client_array);
          
                    var locations = loc_array;

                    var map = new google.maps.Map(document.getElementById('google-map-display'), {
                      zoom: 10,
                      center: new google.maps.LatLng(lati_map,longi_map),
                      mapTypeId: google.maps.MapTypeId.ROADMAP
                    });

                    var infowindow = new google.maps.InfoWindow();

                    var marker, i;

                    for (i = 0; i < locations.length; i++) {  

                      marker = new google.maps.Marker({
                           
                        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                        map: map
                      });

                      google.maps.event.addListener(marker, 'click', (function(marker, i) {
                        return function() {
                          infowindow.setContent(locations[i][0]);
                          infowindow.open(map, marker);
                        }
                      })(marker, i));
                    }  
                    var latlngbounds = new google.maps.LatLngBounds();
                    for (i = 0; i < locations.length; i++) {
                        latlngbounds.extend(new google.maps.LatLng(locations[i][1], locations[i][2]));
                    }
                    map.fitBounds(latlngbounds);

                        
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });     
       

}


</script>