const express = require("express");
const router = express.Router();

router.use('/products', require(`./products`));
router.use('/slides', require(`./slides`));

module.exports = router;