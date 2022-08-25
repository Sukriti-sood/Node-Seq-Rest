const Psychiatrist = require("../models/psychiatrist")


/* middleware
   psychiatristicId can be passed as any way ... in body or parameter,
   but currently it is passed in body
*/
const checkPsyciatrisht = ((req, res, next)=>{
    const psychiatristId = req.body.psychiatristId;
    Psychiatrist.findByPk(psychiatristId)
    .then((psychiatrist)=>{
      req.psychiatrist = psychiatrist;
      return next();
    })
    .catch((err)=>res.render("error", {error: err, "message": "Psychiatrict not found"}))
  })

  
  module.exports = {checkPsyciatrisht}