WebApp = angular.module 'WebApp'

class LinksModalCtrl
  constructor: ($scope, $uibModalInstance, link) ->
    $scope.link = link
    new Clipboard('.copy')

    $scope.done = ->
      $uibModalInstance.close()

LinksModalCtrl.$inject = ['$scope', '$uibModalInstance', 'link']
WebApp.controller 'LinksModalCtrl', LinksModalCtrl
