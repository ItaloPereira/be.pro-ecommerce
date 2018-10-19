const Model = require('../utils/model');

class Products extends Model {
    constructor() {
        super('products');
    }

    list({ limit = 12, offset = 0, category_id = null }) {
        const sql = [];
        const params = [];

        sql.push(`SELECT * FROM products`);

        if (category_id) {
            sql.push(`WHERE products.category_id = ?`);
            params.push(category_id);
        }

        sql.push(`ORDER BY last_update ASC LIMIT ? OFFSET ?`)
        params.push(limit, offset)
        
        return this.query(sql.join(' '), params);
    }

    async count(categoty_id = '', connection = null) {
        let sql;
        
        if (categoty_id) {
            sql = `SELECT COUNT(*) AS count FROM products WHERE products.category_id = ?;`;
        } else {
            sql = `SELECT COUNT(*) AS count FROM products;`;
        }

        return this.query(sql, [categoty_id], connection);
    }
}

module.exports = new Products();