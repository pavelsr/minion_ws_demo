function ajax_submit() {

    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/start_task', false);
    xhr.send();

    if (xhr.status != 200) {
      console.log( 'Some problems with AJAX call: '+ xhr.status + ': ' + xhr.statusText );
    } else {
      console.log( 'Ajax sent, server response : '+ xhr.responseText );
    }

}
