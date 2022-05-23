const urlLocal = "http://localhost:3000/"; //https://medlifecrud.herokuapp.com/

module.exports = renderViews = {
    loginView: (req,res) => {
        res.render('login', {

        });
    },
    
    registerView: (req,res) => {
        res.render('register', {

        });
    },
};