WebApp = angular.module 'WebApp'

class LinksCtrl
  constructor: ($scope, Link, $uibModal) ->
    $scope.submit = ->
      return if $scope.form.link.$invalid
      promise = Link.resources.save({ link: $scope.link }).$promise
      promise.then (data) ->
        $scope.link = {}
        showModal(data.link)
      , (fail) ->
        console.log fail.data.messages
      .finally ->
        $('button').blur()
        $scope.disabledSubmit = false

    showModal = (link) ->
      modalInstance = $uibModal.open
        templateUrl: 'modals/link.html'
        controller: 'LinksModalCtrl'
        size: 'sm'
        backdrop: 'static'
        keyboard: false
        resolve:
          link: () -> link

LinksCtrl.$inject = ['$scope', 'Link', '$uibModal']
WebApp.controller 'LinksCtrl', LinksCtrl
