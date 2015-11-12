collegeEvent.controller 'EventsNewEditController', ['$scope', '$http', 'EventsService', '$location', '$pusher', '$sce', ($scope, $http, EventsService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    $scope.requestControl.getActiveOrganizations()

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

    eventStatuses: []

    eventTypes: []

    params: {

      event_status_id: null

      event_type_id: null

      organization_id: null

    }

    organizations: []

    getActiveOrganizations: ->
      EventsService.getActiveOrganizations.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.organizations = responseData.organizations
      )

    getEventDropdowns: ->
      if this.params.organization_id && this.params.organization_id > 0
        EventsService.getEventDropdowns.query({ organization_id: this.params.organization_id }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.eventStatuses = responseData.event_statuses
            $scope.requestControl.eventTypes    = responseData.event_types
        )

  }

################################################################
################# Initialize ###################################

  init()


]
