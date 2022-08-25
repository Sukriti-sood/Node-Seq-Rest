const bcrypt = require("bcrypt");
const Hospital = require('../models/hospital')
const { body } = require('express-validator')
const { validationResult } = require('express-validator/check');

exports.validate = (method) => {
    switch (method) {
      case 'addPatient': {
       return [ 
          body('email', 'Invalid email').exists().isEmail(),
          body('address', "Should be atleast 10 characters").exists().isLength({min: 10}),
          body('phoneNumber', "Should be valid").exists().isMobilePhone(),
          body('password', "must contain one upper character, one lower character and a number. Max length 15 and min length 8").exists().isLength({min: 8, max:15}).not()
          .isLowercase()
          .not()
          .isUppercase()
          .not()
          .isNumeric()
          .not()
          .isAlpha(),
         ]   
      }
    }
  }

exports.addPatient = async(req, res, next) =>{
    try{
    const errors = validationResult(req);

    if(!errors.isEmpty())
    {
        res.status(422).json({errors: errors.array()})
    }

    const name = req.body.name;
    const address = req.body.address;
    const email = req.body.email;
    const phoneNumber = req.body.phoneNumber;
    let password = await bcrypt.hash(req.body.password, 10)
    const photo = req.body.photo;
    // console.log( req.psychiatrist)
    const hospitalId = req.psychiatrist.hospitalId
    req.psychiatrist.createPatient({
        name: name,
        address: address,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        photo: photo,
        hospitalId:hospitalId
    })
    .then((result)=>{
        res.status(200).json({"message":"Patient Added"})
        console.log(result)
    }).catch((err)=>{
        console.log(err)
        res.status(400)
        res.render("error", {error:err, "message": "Error Adding Patient"})})

    }catch(err)
    {
        return next(err)
    }
}

exports.getHospitalData = (req, res, next) =>{
    const hospitalId = req.params.hospitalId;
    let hospital, psychiatristCount, patientCount, psychiatristsDetails;
    Hospital.findByPk(hospitalId)
    .then(async(hosp)=>{
        try{
        hospital=hosp;

        psychiatristCount= await hospital.countPsychiatrists();

        patientCount= await hospital.countPatients();

        psychiatristsDetails= await hospital.getPsychiatrists();

        res.status(200).json({"data":{
            "Hospital name": hospital.name,
            "Total Psychiatrist count": psychiatristCount,
            "Total patients count": patientCount,
            "Psychiatrist Details": psychiatristsDetails
        }})}catch(err)
        {
            console.log(err)
        }
    }).catch((err)=>res.render("error", {"error":err, "message": "Error while fetching Details"}))
}