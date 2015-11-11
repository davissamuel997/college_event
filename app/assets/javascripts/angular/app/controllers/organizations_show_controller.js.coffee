collegeEvent.controller 'OrganizationsShowController', ['$scope', '$http', 'OrganizationsService', '$location', '$pusher', '$sce', ($scope, $http, OrganizationsService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    $scope.requestControl.getOrganizations()

################################################################
############## Other Initializers ##############################

################################################################
################# Request Control ##############################

  $scope.loaderControl = {

    isLoading: false

  }

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    organizations: []

    getOrganizations: ->
      OrganizationsService.getOrganizations.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.organizations = responseData.organizations
      )

  }

################################################################
################# Initialize ###################################

  init()


]
