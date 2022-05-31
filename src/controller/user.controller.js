const {prisma} = require("../database/index");

module.exports = userController = {
  createUser: async (req, res) => {
    const { last_name, first_name, email, password } = req.body;

    console.log(req.body);
    const user = await prisma.user.create({
      data:{
        first_name,
        last_name,
        email,
        password,
        permissions: true,
        group_id: 1
      }
    });

    return res.json(user);
  },

  userLogin: async (req, res) => {},

  getUserByID: (req, res) => {
  },

  getUserByEmail: async (req, res) => {
    const { email } = req.body;
    if(!email) return res.status(401).send('Body necessary!');

    const user = await prisma.user.findMany({
      where: {
        email,
      }
    });

    return res.send(user);
  },
};