import * as morgan from 'morgan';
import * as bodyParser from 'body-parser';
import cors from 'cors';
import * as dotenv from 'dotenv';
import express from 'express';
import { Request, Response } from 'express';

import * as jwt from 'jsonwebtoken';

import { authenticateTokenAdmin, generateAccessToken } from './middleware';

const app = express();
dotenv.config();
app.use(bodyParser.json());
app.use(cors());

const port = 8080;
if (process.env.NODE_ENV === 'development') {
  app.use(morgan.default('dev'));
}

app.post('/', (req: Request, res: Response) => {
  const { username, role } = req.body;
  const token = jwt.sign(
    { username, role },
    process.env.TOKEN_SECRET as string,
    {
      expiresIn: '1h',
    },
  );
  res.status(200).json({ token });
});

app.get('/', async (req: Request, res: Response) => {
  const { token } = req.body;
  const isi = await jwt.verify(
    token,
    process.env.TOKEN_SECRET as string,
    (err: any, decoded: jwt.JwtPayload | undefined) => {
      if (err) return res.sendStatus(403);
      // if (decoded.role !== 'Admin' && decoded.role !== 'Super Admin') {
      //   return res.sendStatus(403);
      // }
      console.log(decoded);
      if (decoded) console.log(decoded.username);
    },
  );
  res.status(200).json({ isi });
});

const server = app.listen({ port }, () =>
  console.log(
    `🚀 Server ready at: http://localhost:${port} \n⭐️ See sample requests: http://pris.ly/e/ts/rest-express#3-using-the-rest-api`,
  ),
);
