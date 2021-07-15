const express = require('express');
const morgan = require('morgan');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
const port: number = 8080;
if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}

const server = app.listen({ port }, () =>
  console.log(
    `🚀 Server ready at: http://localhost:${port} \n⭐️ See sample requests: http://pris.ly/e/ts/rest-express#3-using-the-rest-api`
  )
);
