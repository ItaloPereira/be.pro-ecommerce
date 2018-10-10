const Model = require('../utils/model');
const con = require('../utils/database');
const config = require('../config');

class Products extends Model {
    constructor() {
        super('products');
    }

    list({ limit, offset }) {
        const sql = `SELECT * FROM products LIMIT ? OFFSET ?`;
        const params = [limit, offset];
        return this.query(sql, params);

        //     con.query(sql, (err, result, fields) => {
        //         if (err) throw err;

        //         const sqlProducts = result.map(prod => {
        //             prod.productImage = prod.productImage && `${config.url}/img/products/${prod.productImage}`;
        //             return prod;
        //         });

        //         resolve(sqlProducts);
        //     });
        // });
    }
}

module.exports = new Products();