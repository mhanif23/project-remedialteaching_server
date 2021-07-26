import morgan from 'morgan';
import cors from 'cors';
import * as dotenv from 'dotenv';
import express from 'express';
// import { Request, Response } from 'express';

// import * as jwt from 'jsonwebtoken';

// import { authenticateTokenAdmin, generateAccessToken } from './middleware';

const app = express();
dotenv.config();

app.use(express.json());
app.use(cors());

const port = 8080;
if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}
app.use(morgan('dev'));

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const server = app.listen({ port }, () =>
  console.log(
    `🚀 Server ready at: http://localhost:${port} \n⭐️ See sample requests: http://pris.ly/e/ts/rest-express#3-using-the-rest-api`,
  ),
);
