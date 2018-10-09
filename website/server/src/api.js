'use strict';

const mysql = require('mysql');

const config = require('./config');

const API = {};

const con = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'root',
    database: 'bepro'
});

con.connect(function (err) {
    if (err) throw err;
    console.log("Connected to database!");
});

API.getProducts = ({ page }) => {
    return new Promise((resolve) => {
        const sendPage = page * 12;

        con.query("SELECT * FROM products LIMIT " + sendPage + ", 12", (err, result, fields) => {
            if (err) throw err;

            let products = [];

            result.forEach(prod => {
                products.push({
                    id: prod.id,
                    type: prod.type,
                    title: prod.title,
                    subtitle: prod.subtitle,
                    icon: prod.icon,
                    badge: prod.badge,
                    badgeDirection: prod.badgeDirection,
                    oldPrice: prod.oldPrice,
                    price: prod.price,
                    productImage: prod.productImage && `${config.url}/img/products/${prod.productImage}`,
                    theme: prod.theme
                });
            });

            resolve(products);
        });


    });
}

module.exports = API;