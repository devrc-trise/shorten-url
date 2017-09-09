WebApp = angular.module 'WebApp', [
  'ngRoute'
  'ngAnimate'
  'nprogress-rails'
  'base64'
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

    $routeProvider.otherwise { redirectTo: '/' }
]

WebApp.run ['$rootScope', '$base64', '$http',
  ($rootScope, $base64, $http) ->
    # API auth - set headers
    apiClientUsername  = window.document.getElementsByName('api_client_username')[0].content
    apiClientPassword = window.document.getElementsByName('api_client_password')[0].content
    apiToken = $base64.encode("#{apiClientUsername}:#{apiClientPassword}")

    $http.defaults.headers.common['Authorization'] = "Basic #{apiToken}"
]
