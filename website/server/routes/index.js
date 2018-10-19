const express = require("express");
const router = express.Router();

router.use('/products', require(`./products`));
router.use('/headerslides', require(`./headerslides`));

module.exports = router;