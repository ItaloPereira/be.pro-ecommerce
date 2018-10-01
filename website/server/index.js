const express = require("express");
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');

const server = express();
const router = express.Router();

server.use(express.static('./public/'));
server.use(bodyParser.json());
server.use(cors());

server.use('/api', router);

router.get('/products', (req, res) => {

    const data = {
        products: [
            {
                id: '0',
                type: '0',
                icon: 'fire',
                title: 'POPULAR PRODUCT',
                subtitle: 'More Product'
            },
            {
                id: '1',
                type: '1',
                title: 'Flecked cotton-blend',
                price: '$175.00 USD',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: '2',
                type: '1',
                badge: 'sale',
                badgeDirection: 'right',
                title: 'Flecked cotton-blend',
                price: '$175.00 USD',
                oldPrice: '$200.00',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: '3',
                type: '1',
                title: 'Flecked cotton-blend',
                price: '$175.00 USD',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: '4',
                type: '1',
                badge: 'free',
                badgeDirection: 'right',
                title: 'Flecked cotton-blend',
                price: '$0.00 USD',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: '5',
                type: '1',
                badge: 'new',
                badgeDirection: 'left',
                title: 'Striped cotton',
                price: '$50.00 USD',
                theme: 'blue-theme',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: '6',
                type: '1',
                badge: 'old',
                badgeDirection: 'right',
                title: 'Striped cotton',
                oldPrice: '$75.00 USD',
                price: '$50.00 USD',
                theme: 'blue-theme',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: '7',
                type: '1',
                title: 'Striped cotton',
                price: '$50.00 USD',
                theme: 'blue-theme',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: '8',
                type: '1',
                badge: 'asf',
                badgeDirection: 'right',
                title: 'Flecked cotton-blend',
                price: '$175.00 USD',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: '9',
                type: '1',
                title: 'Flecked cotton-blend',
                price: '$175.00 USD',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: '10',
                type: '1',
                title: 'Flecked cotton-blend',
                badge: 'freela',
                badgeDirection: 'left',
                price: '$170.00 USD',
                productImage: 'http://localhost:3030/img/product.png'
            }
        ]
    }

    res.status(200).send(data);
});

server.listen(3030, '127.0.0.1', function () {
    console.log('Started Node.js HTTP Server.');
});