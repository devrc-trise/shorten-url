WebApp = angular.module 'WebApp'

class VisitsModalCtrl
  constructor: ($scope, $uibModalInstance, visit) ->
    $scope.visit = visit

    $scope.hideData = (key) ->
      ['id', 'link_id', 'created_at', 'updated_at'].indexOf(key) isnt -1

    $scope.done = ->
      $uibModalInstance.close()

VisitsModalCtrl.$inject = ['$scope', '$uibModalInstance', 'visit']
WebApp.controller 'VisitsModalCtrl', VisitsModalCtrl
