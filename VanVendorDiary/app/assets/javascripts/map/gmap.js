// code from https://github.com/NouranMahmoud/GoogleMapTut/
var map;
var info;
var markers = gon.vendors;

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(49.2812, -123.1258),
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.NORMAL,
    panControl: true,
    scaleControl: false,
    streetViewControl: true,
    overviewMapControl: true
  };

  // initializing map
  map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);

  populateMap();
}

function populateMap() {
  console.log("populating map");

  for (var i in markers) {

    var markerPos = new google.maps.LatLng( markers[i].lat, markers[i].lon );

    var marker = new google.maps.Marker({
      position: markerPos,
      map: map,
      title: markers[i].business_name,
    });

    var infoWindow = new google.maps.InfoWindow({
      content: "<h3>" + markers[i].business_name + "</h3>" +
      "<strong>Type of food: </strong>" + markers[i].description + "<br />" +
      "<strong>Location: </strong>" + markers[i].location 
    });

    google.maps.event.addListener(marker, 'click', function(pointer, bubble) {
      return function() {
        bubble.open(map, pointer);
      };
    }(marker, infoWindow));

    console.log(i);
  }
}

function loadScript() {
	console.log("map loading ...");
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    '&libraries=drawing'+
    '&callback=initialize';
    document.body.appendChild(script);
}
