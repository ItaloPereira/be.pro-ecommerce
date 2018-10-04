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
    let lastPage;

    if (req.query.page == 0) {
        lastPage = false;
    } else {
        lastPage = true;
    }

    const data = {
        products: [
            {
                id: 0,
                type: '0',
                icon: 'fire',
                title: 'POPULAR PRODUCT',
                subtitle: 'More Product'
            },
            {
                id: 1,
                type: '1',
                title: 'Striped cotton t-shirt',
                price: '$175.00 USD',
                productImage: 'http://localhost:3030/img/product4.png'
            },
            {
                id: 2,
                type: '1',
                badge: 'sale',
                badgeDirection: 'right',
                title: 'Flecked cotton-blend',
                price: '$175.00 USD',
                oldPrice: '$200.00 USD',
                productImage: 'http://localhost:3030/img/product2.png'
            },
            {
                id: 3,
                type: '1',
                title: 'V-neck cotton t-shirt',
                price: '$175.00 USD',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: 4,
                type: 1,
                badge: 'free',
                badgeDirection: 'right',
                title: 'Message cotton t-shirt',
                price: '$0.00 USD',
                productImage: 'http://localhost:3030/img/product3.png'
            },
            {
                id: 5,
                type: '1',
                badge: 'new',
                badgeDirection: 'left',
                title: 'Sequin star t-shirt',
                price: '$50.00 USD',
                theme: 'blue-theme',
                productImage: 'http://localhost:3030/img/product4.png'
            },
            {
                id: 6,
                type: '1',
                badge: 'old',
                badgeDirection: 'right',
                title: 'Ruffle sleeve t-shirt',
                oldPrice: '$75.00 USD',
                price: '$50.00 USD',
                theme: 'blue-theme',
                productImage: 'http://localhost:3030/img/product2.png'
            },
            {
                id: 7,
                type: '1',
                title: 'Double layer top',
                price: '$50.00 USD',
                theme: 'blue-theme',
                productImage: 'http://localhost:3030/img/product.png'
            },
            {
                id: 8,
                type: '1',
                badge: 'asf',
                badgeDirection: 'right',
                title: 'Nike Dry Swoosh',
                price: '$175.00 USD',
                productImage: 'http://localhost:3030/img/product3.png'
            },
            {
                id: 9,
                type: '1',
                title: 'Flecked cotton-blend',
                price: '$175.00 USD',
                productImage: 'http://localhost:3030/img/product4.png'
            },
            {
                id: 10,
                type: '1',
                title: 'Sequin star t-shirt',
                badge: 'freela',
                badgeDirection: 'left',
                price: '$170.00 USD',
                productImage: 'http://localhost:3030/img/product2.png'
            },
            {
                id: 11,
                type: '1',
                title: 'Sequin star t-shirt',
                price: '$170.00 USD',
                productImage: 'http://localhost:3030/img/product.png'
            }
        ],
        pagination: {
            isLastPage: lastPage,
            thisPage: req.query.page++
        }
    };
    console.log('get products');
    
    res.status(200).send(data);
});

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

server.listen(3030, '127.0.0.1', function () {
    console.log('Started Node.js HTTP Server.');
});