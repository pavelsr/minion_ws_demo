(function() {

    var ws = new WebSocket('ws://localhost:3050/ws');

    ws.onopen = function () {
        console.log('Websocket connection opened');
    };

    ws.onmessage = function (msg) {
        var res = JSON.parse(msg.data);
        console.log("New ws message  : "+res);
    };

})();
