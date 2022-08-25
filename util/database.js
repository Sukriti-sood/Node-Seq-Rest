const Sequelize = require('sequelize');

require('dotenv').config()

const sequelize = new Sequelize(process.env.DB_NAME, process.env.Username, process.env.PASSWORD, {
  dialect: 'mysql',
  host: process.env.HOST
});

module.exports = sequelize;
