const express = require("express");
const router = express.Router();

router.use('/products', require(`./products`));
router.use('/headerslides', require(`./header-slides`));
router.use('/partnersslides', require(`./partners-slides`));

module.exports = router;