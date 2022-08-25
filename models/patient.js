const Sequelize = require('sequelize');

const sequelize = require('../util/database');

const Patient = sequelize.define('patient', {
    id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
      },
      name:{
        type: Sequelize.STRING,
        allowNull: false
      },
      address:{
        type: Sequelize.STRING,
        allowNull: false,
        // validate:{
        //     len: [10,]
        // }
      },
      email:{
        type: Sequelize.STRING,
        allowNull: false,
        validate: {
            isEmail: true
        }
      },
      phoneNumber:{
        type: Sequelize.INTEGER,
      },
      password:{
        type: Sequelize.STRING,
        allowNull: false,
        // validate: {
        //     is: ["^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{10,12}$"]
        // },
      },
      photo:{
        type: Sequelize.STRING,
        allowNull: false
       },
      psychiatristId:{
        type: Sequelize.INTEGER,
        references: {
          model: "psychiatrists",
          key: "id"
        }
      },
      hospitalId: {
        type: Sequelize.INTEGER,
        references: {
          model: "hospitals",
          key: "id"
        }        
      }     
})


module.exports = Patient;