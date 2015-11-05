collegeEvent.factory 'UniversitiesService', ['$resource', '$q', '$http', ($resource, $q, $http) ->

  getUniversities: $resource "/get_universities.json", {}, query: { method: 'GET', isArray: false }

]