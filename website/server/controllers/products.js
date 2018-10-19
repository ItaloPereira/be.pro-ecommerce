const ProductsModel = require(`../models/products`);
const config = require(`../config`);
const Products = {};

Products.list = async (limit, offset, category_id) => {
    let products = await ProductsModel.list({limit, offset, category_id});
    const [{count}] = await ProductsModel.count(category_id);

    products.map((prod, index) => {
        if (products[index].thumb)
        products[index].thumb = `${config.url}/img/products/real/${prod.thumb}`;

        if (products[index].tiny_thumb)
        products[index].tiny_thumb = `${config.url}/img/products/tiny/${prod.tiny_thumb}`;
    });

    const data = products;

    //modifies
    return { data, count };
}

module.exports = Products;