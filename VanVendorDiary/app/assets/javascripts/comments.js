function userComments() {
  document.getElementById("user_history").style.display = 'none';
  document.getElementById("user_comments").style.display = 'inline';
  document.getElementById("user_favourites").style.display = 'none';
}

function userHistory() {
  document.getElementById("user_history").style.display = 'inline';
  document.getElementById("user_comments").style.display = 'none';
  document.getElementById("user_favourites").style.display = 'none';
}

function userFavourites() {
  document.getElementById("user_history").style.display = 'none';
  document.getElementById("user_comments").style.display = 'none';
  document.getElementById("user_favourites").style.display = 'inline';
}