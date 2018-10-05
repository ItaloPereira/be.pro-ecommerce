var request = require("request");

var updatePage = function (json, id, url) {
    var widgetJson = json;

    var options = {
        uri: url + "widget/" + id,
        method: "POST",
        json: true,
        body: widgetJson
    };
    request(options, function (error, response, body) {

        if(error) {
            console.log(error);
        } else {
            console.log(body.data);
        }

    });
};

module.exports = updatePage;

