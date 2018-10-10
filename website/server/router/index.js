const express = require("express");
const router = express.Router();

const classProducts = require('../src/products');

router.get('/slides', (req, res) => {
    const data = {
        slides: [
            {
                id: 0,
                type: '1',
                textBack: 'FASHION',
                title: 'New Arrival',
                buttonText: 'BUY NOW',
                bgrImg: 'http://localhost:3030/img/bgr-header.png'
            },
            {
                id: 1,
                type: '1',
                textBack: 'COTTON',
                title: 'Cotton Clothes',
                buttonText: 'SEE NOW',
                bgrImg: 'http://localhost:3030/img/bgr-header2.png'
            },
            {
                id: 2,
                type: '1',
                textBack: 'PRET CAPS',
                title: 'New Caps',
                buttonText: 'BUY NOW',
                bgrImg: 'http://localhost:3030/img/bgr-header3.png'
            }
        ]
    };
    console.log('get slides');
    res.status(200).send(data);
});

module.exports = router;