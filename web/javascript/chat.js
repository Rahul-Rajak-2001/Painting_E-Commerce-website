function refreshChat() {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
      document.querySelector('.messages').innerHTML = this.responseText;
// document.querySelector('.dynamic-messages').innerHTML = this.responseText;
    }
  };
  xhr.open('GET', 'refresh_chat.jsp', true);
  xhr.send();
}

setInterval(refreshChat, 1000); // Refresh chat every 2 seconds