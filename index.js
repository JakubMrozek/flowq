var Flow = require('./lib/Flow');
var __slice = [].slice;

module.exports = function() {
  var bindObject, firstParams;
  bindObject = arguments[0], firstParams = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
  return new Flow(bindObject, firstParams);
};