const Model = require('../utils/model');

class Products extends Model {
    constructor() {
        super('products');
    }

    list({ limit = 12, offset = 0 }) {
        const sql = `SELECT * FROM products LIMIT ? OFFSET ?`;
        const params = [limit, offset];
        return this.query(sql, params);
    }
}

module.exports = new Products();