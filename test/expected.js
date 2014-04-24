ng = function($scope, foo) {}
function ng($scope, foo) {}
var ng1 = ng.toString();

var controller = ['$scope', 'foo', 'bar', function($scope, foo, bar) {
  console.log(foo, bar);
}];

app.service('foo', ['$scope', 'foo', 'bar', function controller($scope, foo, bar) {
  console.log(foo, bar);
}]);
