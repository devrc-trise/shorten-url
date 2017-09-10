LinkService = angular.module 'LinkService', ['ngResource']

LinkService.factory 'Link', ['$resource',
  ($resource) ->
    resources: $resource '/api/links/:action.json', { action: '@action' }
    resource: $resource '/api/links/:id/:action.json', { id: '@id', action: '@action' }
]
