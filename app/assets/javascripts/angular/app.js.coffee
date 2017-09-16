WebApp = angular.module 'WebApp', [
  'ngRoute'
  'ngAnimate'
  'nprogress-rails'
  'base64'
  'angularMoment'
  'chart.js'
  'ui.bootstrap'
  'LinkService'
]

WebApp.config ['$routeProvider', '$httpProvider',
  ($routeProvider, $httpProvider) ->
    $routeProvider.when '/', {
      label: 'Homepage'
      templateUrl: '/templates/links/index.html'
      controller: 'LinksCtrl'
    }

    $routeProvider.when '/:id', {
      label: 'Link Analytics'
      templateUrl: '/templates/links/show.html'
      controller: 'LinksShowCtrl'
    }

    $routeProvider.otherwise { redirectTo: '/' }
]

WebApp.run ['$rootScope', '$base64', '$http',
  ($rootScope, $base64, $http) ->
    # Pagination default values
    $rootScope.loadingTxt = 'loading...'
    $rootScope.noDataTxt = 'No data found.'
    $rootScope.page = 1
    $rootScope.perPage = 10
    $rootScope.totalItems = 0

    # API auth - set headers
    apiClientUsername  = window.document.getElementsByName('api_client_username')[0].content
    apiClientPassword = window.document.getElementsByName('api_client_password')[0].content
    apiToken = $base64.encode("#{apiClientUsername}:#{apiClientPassword}")

    $http.defaults.headers.common['Authorization'] = "Basic #{apiToken}"
]

WebApp.filter(
  'url', ->
    (url) ->
      if (!/^https?:\/\//i.test(url)) then "http://#{url}" else url
)
