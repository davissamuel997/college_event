collegeEvent.factory 'OrganizationsShowService', ['$resource', '$q', '$http', ($resource, $q, $http) ->

  getOrganization: $resource "/get_organization.json", {}, query: { method: 'GET', isArray: false }

]