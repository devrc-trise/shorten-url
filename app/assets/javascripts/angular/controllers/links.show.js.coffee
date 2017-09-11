WebApp = angular.module 'WebApp'

class LinksShowCtrl
  constructor: ($scope, $routeParams, $uibModal, Link) ->
    Link.resource.get { id: $routeParams.id }, (data) ->
      $scope.link = data.link

    loadVisits = ->
      $scope.emptyTxt = $scope.loadingTxt
      Link.resource.get { id: $routeParams.id, action: 'visits', page: $scope.page, per_page: $scope.perPage }, (data) ->
        $scope.emptyTxt = $scope.noDataTxt
        $scope.visits = data.visits
        $scope.totalItems = data.total

    $scope.pageChanged = ->
      loadVisits()

    $scope.showModal = (visit) ->
      modalInstance = $uibModal.open
        templateUrl: 'modals/visit.html'
        controller: 'VisitsModalCtrl'
        size: 'md'
        keyboard: true
        resolve:
          visit: () -> visit

    loadVisits()

LinksShowCtrl.$inject = ['$scope', '$routeParams', '$uibModal', 'Link']
WebApp.controller 'LinksShowCtrl', LinksShowCtrl
