const route = require('express').Router();
const renderViews = require('./render');
const userController = require('../controller/user.controller')

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


//API
route.post('/api/user', userController.createUser);
route.get('/api/user', userController.getUserByEmail);

module.exports = route;