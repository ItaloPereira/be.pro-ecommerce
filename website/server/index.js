const express = require("express");
const bodyParser = require('body-parser');
const cors = require('cors');
const database = require(`./utils/database`);

const server = express();

database.createPool();

server.use(express.static('./public/'));
server.use(bodyParser.json());
server.use(cors());

server.use('/api', require('./routes'));

server.listen(3030, '127.0.0.1', function () {
    console.log('Started Node.js HTTP Server.');
});