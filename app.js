const app = require('express')();
const dotenv = require('dotenv');
dotenv.config();

app.set("view engine", "ejs");

const PORT = process.env.PORT || 8080;
app.use('/', require('./src/routes/router'));
app.listen(PORT, console.log(`Server on PORT: ${PORT}`));