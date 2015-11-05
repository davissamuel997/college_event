collegeEvent.controller 'OrganizationTypesController', ['$scope', '$http', 'OrganizationTypesService', '$location', '$pusher', '$sce', ($scope, $http, OrganizationTypesService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    $scope.requestControl.getOrganizationTypes()

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

    organization_types: []

    getOrganizationTypes: ->
      OrganizationTypesService.getOrganizationTypes.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.organization_types = responseData.organization_types
      )

  }

################################################################
################# Initialize ###################################

  init()


]
