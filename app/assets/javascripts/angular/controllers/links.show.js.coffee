WebApp = angular.module 'WebApp'

class LinksShowCtrl
  constructor: ($scope, $routeParams, Link) ->
    Link.resource.get { id: $routeParams.id }, (data) ->
      $scope.link = data.link

LinksShowCtrl.$inject = ['$scope', '$routeParams', 'Link']
WebApp.controller 'LinksShowCtrl', LinksShowCtrl
