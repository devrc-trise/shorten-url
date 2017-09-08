WebApp = angular.module 'WebApp', [
  'ngRoute'
  'ngAnimate'
  'nprogress-rails'
  'LinkService'
  'ui.bootstrap'
]

WebApp.config ['$routeProvider', '$httpProvider',
  ($routeProvider, $httpProvider) ->
    $routeProvider.when '/', {
      label: 'Homepage'
      templateUrl: '/templates/links/index.html'
      controller: 'LinksCtrl'
    }

    $routeProvider.otherwise { redirectTo: '/' }
]
