import express, { Express, Request, Response, urlencoded } from 'express';
import os from 'os';

const HTTP_PORT = 8080;
const server: Express = express();

server
    .use(urlencoded({
        extended: true,
    }))
    .all('*', (request: Request, response: Response) => {
        response.json({
            hostname: os.hostname(),
            type: os.type(),
            loadavg: os.loadavg(),
        });
    })
    .listen(HTTP_PORT,  () => console.log(`Listening on ${HTTP_PORT}`));