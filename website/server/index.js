const express = require("express");
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');

const server = express();
const router = express.Router();

server.use(express.static('./public/'));
server.use(bodyParser.json());
server.use(cors());

// server.use('/api', router);

// router.get('/products', (req, res) => {

//     const data = {
//         products: [
//             {
//                 title: 'product 1',
//                 price: '$100,00'
//             }, {
//                 title: 'product 2',
//                 price: '$150,00'
//             },
//         ]
//     }

//     res.status(200).send(data);
// });

server.listen(3030, '127.0.0.1', function () {
    console.log('Started Node.js HTTP Server.');
});