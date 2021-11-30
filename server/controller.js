var sdk = require('./sdk.js');
module.exports = function(app){
  app.get('/api/getWallet', function (req, res) {
    var id = req.query.id;
    let args = [id];
    sdk.send(false, 'getWallet', args, res);
  });

  app.get('/api/getUser', function (req, res) {
    var id = req.query.id;
    let args = [id];
    sdk.send(false, 'getUser', args, res);
  });

  app.get('/api/setWallet', function (req, res){
    var name = req.query.name;
		var id = req.query.id;
    var coin = req.query.coin;
    let args = [name, id, coin];
    sdk.send(true, 'setWallet', args, res);
  });

  app.get('/api/createUser', function (req, res){
    var name = req.query.name;
		var id = req.query.id;
    var password = req.query.password;
    var coin = req.query.coin;
    var repairathority = req.query.repairathority;
    let args = [name, id, password, coin, repairathority];
    sdk.send(true, 'createUser', args, res);
  });

  app.get('/api/getCar', function(req, res){
    var carkey = req.query.carkey;
    let args = [carkey];
    sdk.send(false, 'getCar', args, res);
  });

  app.get('/api/setCar', function (req, res) {
    var thumbnail = req.query.thumbnail;
    var title = req.query.title;
    var country = req.query.country;
    var cartype = req.query.cartype;
    var manufacturer = req.query.manufacturer;
    var model = req.query.model;
    var modelgen = req.query.modelgen;
    var modeldetail = req.query.modeldetail;
    var year = req.query.year;
    var yeardetail = req.query.yeardetail;
    var distancedriven = req.query.distancedriven;
    var price = req.query.price;
    var sellercategory = req.query.sellercategory;
    var color = req.query.color;
    var fuel = req.query.fuel;
    var gearbox = req.query.gearbox;
    var option = req.query.option;
    var accident = req.query.accident;
    var seaters = req.query.seaters;
    var region = req.query.region;
    var badge = req.query.badge;
    var insurancehistory = req.query.insurancehistory;
    var shipping = req.query.shipping;
    var walletid = req.query.walletid;
    var sellername = req.query.sellername;
    let args = [thumbnail, title, country, cartype, manufacturer, model, modelgen, modeldetail, year, yeardetail, distancedriven, price, sellercategory, color, fuel, gearbox, option, accident, seaters, region, badge, insurancehistory, shipping, walletid, sellername];
    sdk.send(true, 'setCar', args, res);
  });

  app.get('/api/getAllCar', function (req, res) {
    let args = [];
    sdk.send(false, 'getAllCar', args, res);
  });

  app.get('/api/purchaseCar', function (req, res) {
    var walletid = req.query.walletid;
    var carkey = req.query.carkey;
    var walletid_1 = req.query.walletid_1;
    let args = [walletid, walletid_1, carkey];
    sdk.send(true, 'purchaseCar', args, res);
  });

  app.get('/api/deleteCar', function (req, res){
    var carkey = req.query.carkey;
    let args = [carkey];
    sdk.send(true, 'deleteCar', args, res);
  });

  app.get('/api/setRepair', function (req, res) {
    var engineer = req.query.engineer;
    var date = req.query.date;
    var rcar = req.query.rcar;
    var information = req.query.information
    let args = [engineer, date, rcar, information];
    sdk.send(true, 'setRepair', args, res);
  });

  app.get('/api/getRepair', function (req, res){
    var repairkey = req.query.repairkey;
    let args = [repairkey];
    sdk.send(false, 'getRepair', args, res);
  });

  app.get('/api/login', function (req, res) {
    var userid = req.query.userid;
    var password = req.query.password;
    let args = [userid, password];
    sdk.send(true, 'login', args, res);
  });

  app.get('/api/chargeToken', function (req, res){
    var id = req.query.id;
    var token = req.query.token;
    let args = [id, token];
    sdk.send(true, 'chargeToken', args, res);
  });

  /*app.get('/api/setInsurance', function (req, res) {
    var icar = req.query.icar;
    var turm = req.query.turm;
    let args = [icar, turm];
    sdk.send(true, 'setInsurance', args, res);
  });
  app.get('/api/getInsurance', function(req, res){
    var insurancekey = req.query.insurancekey;
    let args = [insurancekey];
    sdk.send(false, 'getInsurance', args, res);
  });

  app.get('/api/setRenewal', function (req, res) {
    var insurancekey = req.query.insurancekey;
    var turm = req.query.turm;
    let args = [insurancekey, turm];
    sdk.send(true, 'setRenewal', args, res);
  });*/

  app.get('/api/getAllRepair', function (req, res) {
    let args = [];
    sdk.send(false, 'getAllRepair', args, res);
  });

  /*app.get('/api/getAllInsurance', function (req, res) {
    let args = [];
    sdk.send(false, 'getAllInsurance', args, res);
  });*/
}