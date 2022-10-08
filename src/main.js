const express = require('express');

const HTTP_PORT = 80;

const server = express();
server
    .use(express.urlencoded({
        extended: true,
    }))
    .all('*', (request, response) => {
        response.json({
            received: request.body
        });
    })
    .listen(HTTP_PORT,  () => console.log(`Listening on ${HTTP_PORT}`));