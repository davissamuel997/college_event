collegeEvent.controller 'OrganizationsController', ['$scope', '$http', 'OrganizationsService', '$location', '$pusher', '$sce', ($scope, $http, OrganizationsService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    setUpCurrentUserId()

    $scope.requestControl.getOrganizations()

################################################################
############## Other Initializers ##############################

  setUpCurrentUserId = ->
    if $('#user_id') && $('#user_id').length > 0 && $('#user_id')[0].value && parseInt($('#user_id')[0].value, 10) > 0
      $scope.requestControl.current_user_id = parseInt($('#user_id')[0].value, 10)

################################################################
################# Request Control ##############################

  $scope.loaderControl = {

    isLoading: false

  }

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    current_user_id: null

    organizations: []

    scopedOrganizationIndex: null

    getOrganizations: ->
      OrganizationsService.getOrganizations.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.organizations = responseData.organizations
      )

    joinOrganization: (organization_id, organizationIndex) ->
      if this.current_user_id && this.current_user_id > 0
        this.scopedOrganizationIndex = organizationIndex

        OrganizationsService.joinOrganization.query({ user_id: this.current_user_id, organization_id: organization_id }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.organizations[$scope.requestControl.scopedOrganizationIndex] = responseData.organization

            $scope.requestControl.scopedOrganizationIndex = null

            gritterAdd("Successfully joined the organization.")
        )

  }

################################################################
################# Initialize ###################################

  init()


]
