const ProductsModel = require(`../models/products`);
const Products = {};

Products.list = async (limit, offset) => {
    let products = await ProductsModel.list({limit, offset});
    const total = await ProductsModel.count();

    products.map((prod, index) => {
        products[index].productImage = `http://localhost:3030/img/products/${prod.productImage}`;
    });

    const data = {
        products: products,
        total: total[0]['COUNT(*)']
    }
    //modifies
    return data;
}

module.exports = Products;