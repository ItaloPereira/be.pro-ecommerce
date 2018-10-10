const database = require('./database');

class Model {
    constructor(tableName) {
        this.tableName = tableName;
    }

    async query(sql, params, connection = null) {
        if (!connection) {
            connection = database;
        }

        const [rows] = await connection.execute(sql, params);
        return rows;
    }


    async count(connection = null) {
        const sql = `SELECT COUNT(*) FROM ${this.tableName};`;
        return this.query(sql, [], connection);
    }


}

module.exports = Model;