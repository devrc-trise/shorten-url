LinkService = angular.module 'LinkService', ['ngResource']

LinkService.factory 'Link', ['$resource',
  ($resource) ->
    resources: $resource '/api/links/:action.json', { action: '@action' }
]
