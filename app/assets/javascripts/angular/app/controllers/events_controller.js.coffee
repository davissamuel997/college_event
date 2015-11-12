collegeEvent.controller 'EventsController', ['$scope', '$http', 'EventsService', '$location', '$pusher', '$sce', ($scope, $http, EventsService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    $scope.requestControl.getEvents()

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

    events: []

    getEvents: ->
      EventTypesService.getEvents.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.events = responseData.events
      )

  }

################################################################
################# Initialize ###################################

  init()


]
