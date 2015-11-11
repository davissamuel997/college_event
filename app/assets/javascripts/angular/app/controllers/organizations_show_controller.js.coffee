collegeEvent.controller 'OrganizationsShowController', ['$scope', '$http', 'OrganizationsShowService', '$location', '$pusher', '$sce', ($scope, $http, OrganizationsShowService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    initalizeOrganizationId()

    $scope.requestControl.getOrganization()

################################################################
############## Other Initializers ##############################

  initalizeOrganizationId = ->
    if $('#organization_id') && $('#organization_id').length > 0 && $('#organization_id')[0].value && parseInt($('#organization_id')[0].value, 10) > 0
      $scope.requestControl.organization_id = parseInt($('#organization_id')[0].value, 10)

################################################################
################# Request Control ##############################

  $scope.loaderControl = {

    isLoading: false

  }

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    organization: null

    organization_id: null

    getOrganization: ->
      if this.organization_id && this.organization_id > 0
        OrganizationsShowService.getOrganization.query({ organization_id: this.organization_id }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.organization = responseData.organization
        )

  }

################################################################
################# Initialize ###################################

  init()


]
