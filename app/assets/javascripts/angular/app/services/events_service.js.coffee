collegeEvent.factory 'EventsService', ['$resource', '$q', '$http', ($resource, $q, $http) ->

  getEvents: $resource "/get_events.json", {}, query: { method: 'GET', isArray: false }

]