var express = require('express');
var router = express.Router();
const {checkPsyciatrisht} = require("../middleware/index")
const controller = require("../controller/api")


router.post('/add-patient', controller.validate('addPatient'),
checkPsyciatrisht, controller.addPatient);

router.get('/hospital/:hospitalId', controller.getHospitalData);

module.exports = router;
