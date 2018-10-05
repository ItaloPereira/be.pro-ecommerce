var request = require("request");

var createWidget = function (json, url) {
    var widgetJson = json;

    var options = {
        uri: url + "widget",
        method: "POST",
        json: true,
        body: widgetJson
    };
    request(options, function (error, response, body) {

        if(error) {
            console.log(error);
        } else {
            console.log("Widget id: " + body.data.id);
        }

    });
};

module.exports = createWidget;
