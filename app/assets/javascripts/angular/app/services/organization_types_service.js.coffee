collegeEvent.factory 'OrganizationTypesService', ['$resource', '$q', '$http', ($resource, $q, $http) ->

  getOrganizationTypes: $resource "/get_organization_types.json", {}, query: { method: 'GET', isArray: false }

]