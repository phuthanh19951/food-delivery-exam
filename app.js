const express = require('express');
const path = require('path');

const menuRouter = require('./routes/menu');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/menus', menuRouter);

app.use(function(err, req, res, next) {
  console.log(err);
  res.status(err.status || 500).send(err.message);
});

app.listen(3000, function(){
  console.log('Server started successfully. Running on port 3000');
});
