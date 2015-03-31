function switchView() {
  var inner = document.getElementById("switch").innerHTML;
  if (inner == "Switch to List View") {
    document.getElementById("switch").innerHTML = "Switch to Map View";
    document.getElementById("map").style.display = 'none';
    document.getElementById("list").style.display = 'inline';
  } else if (inner == "Switch to Map View") {
    document.getElementById("switch").innerHTML = "Switch to List View";
    document.getElementById("list").style.display = 'none';
    document.getElementById("map").style.display = 'inline';
  }
}