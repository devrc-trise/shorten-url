WebApp = angular.module 'WebApp'

class HomeCtrl
  constructor: ($scope, Link) ->
    $scope.submit = ->
      return if $scope.form.link.$invalid
      promise = Link.resources.save({ link: $scope.link }).$promise
      promise.then (data) ->
        console.log data
        $scope.link = {}
      , (fail) ->
        console.log fail.data.messages
      .finally ->
        $scope.disabledSubmit = false

HomeCtrl.$inject = ['$scope', 'Link']
WebApp.controller 'HomeCtrl', HomeCtrl
