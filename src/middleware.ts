const jwt = require('jsonwebtoken');
import { Request, Response, NextFunction } from 'express';
const dotenv = require('dotenv');

dotenv.config();

type DecodedType = {
  username: string;
  role: string;
  iat: number;
  exp: number;
};

export const authenticateToken = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (token == null) return res.sendStatus(401);
  jwt.verify(token, process.env.TOKEN_SECRET as string, (err: any) => {
    if (err) return res.sendStatus(403);
    next();
  });
};

export const authenticateTokenAdmin = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (token == null) return res.sendStatus(401);
  jwt.verify(
    token,
    process.env.TOKEN_SECRET as string,
    (err: any, decoded: DecodedType) => {
      if (err) return res.sendStatus(403);
      if (decoded.role !== 'Admin' && decoded.role !== 'Super Admin') {
        return res.sendStatus(403);
      }
      next();
    }
  );
};

export const generateAccessToken = (username: string, role: string) => {
  return jwt.sign({ username, role }, process.env.TOKEN_SECRET, {
    expiresIn: '1h',
  });
};
