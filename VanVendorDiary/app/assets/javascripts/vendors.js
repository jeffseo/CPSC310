function switchView() {
  var inner = document.getElementById("switch").innerHTML;
  if (inner == "Switch to list view.") {
    document.getElementById("switch").innerHTML = "Switch to map view.";
    document.getElementById("map").style.display = 'none';
    document.getElementById("list").style.display = 'inline';
  } else if (inner == "Switch to map view.") {
    document.getElementById("switch").innerHTML = "Switch to list view.";
    document.getElementById("list").style.display = 'none';
    document.getElementById("map").style.display = 'inline';
  }
}