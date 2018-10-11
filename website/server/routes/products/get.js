const ProductsController = require(`../../controllers/products`);
const paginate = require(`../../utils/paginate`);

module.exports = async (req, res) => {
    const products = await ProductsController.list(req.query.limit, req.query.offset);
    const pagination = paginate(products.count, req.query);

    res.status(200).send({ data: products.data, pagination });
};