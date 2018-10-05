const request = require('request-promise');
const redirects = require('./redirects.json');
const hash = 'eb3364138c5edc643d6bf0a1aef89700';

async function  start() {
    for(const item of redirects) {
        let result;

        try {
            result = await request.get(item.url);
        } catch (err) {
            console.log(result);
        }

        if(result) {
            let options = {
                method: 'POST',
                uri: `https://flag-embraer.qa.nodo.cc/api/page/${JSON.parse(result).data.id}/shortSlug`,
                json: true,
                headers: {
                    'hash-key': hash
                },
                body: {
                    shortSlug: item.shortSlug
                }
            }

            //console.log(options);

            try {
                await request.post(options);
            } catch (err) {
                console.log(err.message);
            }
        }

    }
}

start();
