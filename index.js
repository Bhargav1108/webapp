'use strict'

var express = require('express');

var app = express()

app.get('/', function(req, res){
  res.send(' HELLO WORLD');
});

/* istanbul ignore next */
if (!module.parent) {
  app.listen(80);
  console.log('Express started on port 80');
}
