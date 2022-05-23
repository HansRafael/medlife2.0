const route = require('express').Router();
const renderViews = require('./render');

/**
 *  @description Login Route
 *  @method GET / 
 */
 route.get('/login', renderViews.loginView);
 
 /**
 *  @description Register Route
 *  @method GET / 
 */
  route.get('/register', renderViews.registerView);


module.exports = route;