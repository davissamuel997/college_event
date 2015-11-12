collegeEvent.factory 'EventsService', ['$resource', '$q', '$http', ($resource, $q, $http) ->

  getActiveOrganizations: $resource "/get_active_organizations.json", {}, query: { method: 'GET', isArray: false }

  getEventDropdowns: $resource "/get_event_dropdowns.json", {}, query: { method: 'GET', isArray: false }

  getEvents: $resource "/get_events.json", {}, query: { method: 'GET', isArray: false }

]