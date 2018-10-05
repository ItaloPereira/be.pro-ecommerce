var request = require("request");

var updatePage = function (json, id, url) {
    var pageJson = json;

    pageJson.containers.forEach(function (container) {
        container.page_id = id;
    });

    var options = {
        uri: url + "page/" + id,
        method: "POST",
        json: true,
        body: pageJson
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

