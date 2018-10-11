const ProductsController = require(`../../controllers/products`);
const paginate = require(`../../utils/paginate`);

module.exports = async (req, res) => {
    const options = {
        limit: Number(req.query.limit),
        offset: Number(req.query.offset)
    }


    const products = await ProductsController.list(options.limit, options.offset);
    const pagination = paginate(products.count, options);

    res.status(200).send({ data: products.data, pagination });
};