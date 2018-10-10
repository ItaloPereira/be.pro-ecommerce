const Model = require('../utils/model');

class Products extends Model {
    constructor() {
        super('products');
    }

    async list(options, connection = null) {
        const params = [];
        const page = options.page + 1;
        const sql = `SELECT *
                    FROM products
                    LIMIT 12
                    OFFSET ${page}`;

        return this.query(sql, params, connection);
    }

}


module.exports = new Products();