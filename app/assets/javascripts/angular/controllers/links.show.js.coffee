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

    $scope.timeframe = 'today'
    $scope.timeframeOpts = [
      { value: 'today', label: 'Today' },
      { value: 'this week', label: 'This Week' },
      { value: 'this month', label: 'This Month' }
    ]
    $scope.chartOptions = {
      maintainAspectRatio: false,
      scales: {
        xAxes: [{
          type: 'time',
          time: {
            unit: 'hour'
          },
          ticks: {
            fontColor: '#cccccc',
            autoSkip: true,
            suggestedMin: 0,
            maxTicksLimit: 10
          }
        }]
        yAxes: [{
          ticks: {
            fontColor: '#cccccc',
            stepSize: 1,
            maxTicksLimit: 5
          }
        }]
      }
    }

    $scope.loadChart = ->
      $scope.showChartLoader = true
      start_date = switch $scope.timeframe
        when 'today' then moment().format('YYYY-MM-DD')
        when 'this week' then moment().startOf('week').format('YYYY-MM-DD')
        when 'this month' then moment().startOf('month').format('YYYY-MM-DD')
      end_date = moment().format('YYYY-MM-DD')
      Link.resource.get { id: $routeParams.id, action: 'analytics', start_date: start_date, end_date: end_date }, (data) ->
        visits_per_hour = if data.total > 0 then data.visits_per_hour else { "#{moment().format('YYYY-MM-DD H:00')}": 0 }
        $scope.showChartLoader = false
        $scope.chartLabels = []
        $scope.chartData = []
        for key, value of visits_per_hour
          $scope.chartLabels.push key
          $scope.chartData.push value
        $scope.chartTotalVisits = data.total

    loadVisits()
    $scope.loadChart()

LinksShowCtrl.$inject = ['$scope', '$routeParams', '$uibModal', 'Link']
WebApp.controller 'LinksShowCtrl', LinksShowCtrl
