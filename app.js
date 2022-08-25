var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

// importing models

const Hospital = require("./models/hospital")
const Patient = require("./models/patient")
const Psychiatrist = require("./models/psychiatrist")

// Associations

Psychiatrist.belongsTo(Hospital, {constraints: true, onDelete: 'CASCADE'})
Hospital.hasMany(Psychiatrist)
Patient.belongsTo(Psychiatrist, {constraints: true, onDelete: 'CASCADE'})
Hospital.hasMany(Patient)
Psychiatrist.hasMany(Patient)

var indexRouter = require('./routes/index');
var apiRouter = require('./routes/api')

var app = express();
require('dotenv').config()

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use("/api", apiRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

/* middleware
   psychiatristicId can be passed as any way ... in body or parameter,
   but currently it is passed in body
*/
// app.use((req, res, next)=>{
//   const psychiatristId = req.body.psychiatristId;
//   console.log(req.body)
//   Psychiatrist.findById(psychiatristId)
//   .then((psychiatrist)=>{
//     req.psychiatrist = psychiatrist;
//     return next();
//   })
//   .catch((err)=>res.render("error", err))
// })

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error',{message: "Error Rendering Page", "error":err});
});

module.exports = app;
