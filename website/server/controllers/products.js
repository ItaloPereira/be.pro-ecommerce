const ProductsModel = require(`../models/products`);
const config = require(`../config`);
const Products = {};

Products.list = async (limit, offset) => {
    let products = await ProductsModel.list({limit, offset});
    const [{count}] = await ProductsModel.count();

    products.map((prod, index) => {
        if (products[index].product_image)
        products[index].product_image = `${config.url}/img/products/${prod.product_image}`;
    });

    const data = products;

    //modifies
    return { data, count };
}

module.exports = Products;