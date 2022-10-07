import express, { Express, Request, Response, urlencoded } from 'express';

const HTTP_PORT = 8080;
const server: Express = express();

server
    .use(urlencoded({
        extended: true,
    }))
    .all('*', (request: Request, response: Response) => {
        response.json({
            received: request.body
        });
    })
    .listen(HTTP_PORT,  () => console.log(`Listening on ${HTTP_PORT}`));