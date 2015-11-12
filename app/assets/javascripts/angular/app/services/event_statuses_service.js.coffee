collegeEvent.factory 'EventStatusesService', ['$resource', '$q', '$http', ($resource, $q, $http) ->

  getOrganizationTypes: $resource "/get_event_statuses.json", {}, query: { method: 'GET', isArray: false }

]