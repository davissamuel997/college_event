collegeEvent.controller 'EventStatusesController', ['$scope', '$http', 'EventStatusesService', '$location', '$pusher', '$sce', ($scope, $http, EventStatusesService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    $scope.requestControl.getEventStatuses()

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

    event_statuses: []

    getEventStatuses: ->
      EventStatusesService.getEventStatuses.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.event_statuses = responseData.event_statuses
      )

  }

################################################################
################# Initialize ###################################

  init()


]
