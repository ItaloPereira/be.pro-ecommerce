const ProductsController = require(`../../controllers/products`);

module.exports = async (req, res) => {
    const products = await ProductsController.list(req.query.limit, req.query.offset);
    res.status(200).send(products);
    // const options = req.query;
    // const products = await classProducts.list(options);
    // const totalProducts = await classProducts.count();
    // const thisPage = Number(options.page) + 1;

    // let data = {
    //     products: products,
    //     pagination: {
    //         thisPage: thisPage,
    //         totalProducts: totalProducts
    //     }
    // };

    // res.status(200).send(data);
    // console.log('get products');
};