'use strict';

const mysql = require('mysql');
const fs = require('fs');

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

API.getProducts = page => {
    return new Promise((resolve) => {
        const sendPage = page * 12;

        con.query("SELECT * FROM products LIMIT " + sendPage + ", 12", (err, result, fields) => {
            if (err) throw err;

            var data = {
                products: []
            };

            result.forEach(prod => {

                if (prod.id == null) delete prod.id;
                if (prod.type == null) delete prod.type;
                if (!prod.title) delete prod.title;
                if (!prod.subtitle) delete prod.subtitle;
                if (!prod.icon) delete prod.icon;
                if (!prod.badge) delete prod.badge;
                if (!prod['badge-direction']) delete prod['badge-direction'];
                if (!prod['old-price']) delete prod['old-price'];
                if (!prod.price) delete prod.price;
                if (!prod['product-image']) delete prod['product-image'];
                if (!prod.theme) delete prod.theme;

                data.products.push({
                    id: prod.id,
                    type: prod.type,
                    title: prod.title,
                    subtitle: prod.subtitle,
                    icon: prod.icon,
                    badge: prod.badge,
                    badgeDirection: prod['badge-direction'],
                    oldPrice: prod['old-price'],
                    price: prod.price,
                    productImage: prod['product-image'] && config.url + prod['product-image'],
                    theme: prod.theme
                });
            });


            resolve(data);
        });


    });
}

module.exports = API;