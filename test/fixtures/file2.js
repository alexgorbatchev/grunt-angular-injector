ng = function($scope, foo) {}
function ng($scope, foo) {}
var ng1 = ng.toString();

var controller = ng(function($scope, foo, bar) {
  console.log(foo, bar);
});

app.service('foo', ng(function controller($scope, foo, bar) {
  console.log(foo, bar);
}));
