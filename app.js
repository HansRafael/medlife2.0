const app = require('express')();
const dotenv = require('dotenv');
const bodyParser = require('body-parser')
dotenv.config();

app.use(
  bodyParser.json({
    limit: "1mb",
  })
);

app.use(
  bodyParser.urlencoded({
    limit: "1mb",
    extended: true,
  })
);

app.set("view engine", "ejs");

const PORT = process.env.PORT || 8080;
app.use('/', require('./src/routes/router'));
app.listen(PORT, console.log(`Server on PORT: ${PORT}`));