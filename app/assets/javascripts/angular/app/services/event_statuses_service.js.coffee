collegeEvent.factory 'EventStatusesService', ['$resource', '$q', '$http', ($resource, $q, $http) ->

  getEventStatuses: $resource "/get_event_statuses.json", {}, query: { method: 'GET', isArray: false }

]