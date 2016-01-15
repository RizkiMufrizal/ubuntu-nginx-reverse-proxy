/*
 * Belajar-Reverse-Proxy.js
 * Copyright (C) 2016 Rizki Mufrizal <mufrizalrizki@gmail.com>
 *
 * Distributed under terms of the MIT license.
 */

var http = require('http');

http.createServer(function (req, res) {
    res.writeHead(200, {
        'Content-Type': 'text/plain'
    });
    res.end('Belajar Reverse Proxy Pada Nginx\n');
}).listen(3000, '127.0.0.1');

console.log('Server jalan di http://127.0.0.1:3000/');
