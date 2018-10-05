var request = require("request");

var createPage = function (json, url) {
    var pageJson = json;

    var options = {
        uri: url + "page",
        method: "POST",
        json: true,
        body: pageJson
    };
    request(options, function (error, response, body) {

        if(error) {
            console.log(error);
        } else {
            console.log("page_id: " + body.data.id);
        }

    });
};

module.exports = createPage;

