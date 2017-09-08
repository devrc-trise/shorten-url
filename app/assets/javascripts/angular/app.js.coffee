WebApp = angular.module 'WebApp', [
  'ngRoute'
  'ngAnimate'
  'nprogress-rails'
  'LinkService'
]

WebApp.config ['$routeProvider', '$httpProvider',
  ($routeProvider, $httpProvider) ->
    $routeProvider.when '/', {
      label: 'Homepage'
      templateUrl: '/templates/index.html'
      controller: 'HomeCtrl'
    }

    $routeProvider.otherwise { redirectTo: '/' }
]
