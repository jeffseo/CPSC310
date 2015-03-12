// code from https://github.com/NouranMahmoud/GoogleMapTut/
$(window).load(function() {
  loadScript();
});

var map;
var info;
var marker;
var info;
var markers = [];

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

  // add static marker with infowindow
  createMarker({lat: 49.2812, lng: -123.1258}, map, "a marker!");
  var info = createInfoWindow("Vendor A");
  google.maps.event.addListener(marker, 'click', function() {
    info.open(map,marker);
  });

  createMarker({lat: 49.2800, lng: -123.1252}, map, "another marker!");
  info = createInfoWindow("Vendor B");
  google.maps.event.addListener(marker, 'click', function() {
    info.open(map,marker);
  });
}

function createMarker(coords, map, title) {
  marker = new google.maps.Marker({
    position: coords,
    map: map,
    title: title
  })

  info = createInfoWindow(title);
  
  google.maps.event.addListener(marker, 'click', function() {
    info.open(map, marker);
  });
}

function createInfoWindow(text){
  var infowindow = new google.maps.InfoWindow({
    content: text
  });
  return infowindow;
}

function loadScript() {
	console.log("map loading ...");
  var script = document.createElement('script');
  script.type = 'text/javascript';
  //'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBJYFdplGeKUUEmGZ-vL4ydiSZ09Khsa_o&sensor=false&libraries=drawing'
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    //'&v=3.14'+
    //'&key=AIzaSyBJYFdplGeKUUEmGZ-vL4ydiSZ09Khsa_o'+
    '&libraries=drawing'+
    '&callback=initialize';
    document.body.appendChild(script);
  }
