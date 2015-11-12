collegeEvent.factory 'OrganizationsService', ['$resource', '$q', '$http', ($resource, $q, $http) ->

  getOrganizations: $resource "/get_organizations.json", {}, query: { method: 'GET', isArray: false }

  joinOrganization: $resource "/join_organization.json", {}, query: { method: 'GET', isArray: false }
]