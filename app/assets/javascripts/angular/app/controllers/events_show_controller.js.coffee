collegeEvent.controller 'EventsShowController', ['$scope', '$http', 'OrganizationsService', '$location', '$pusher', '$sce', ($scope, $http, OrganizationsService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
  	$scope.requestControl.initMap()

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

    initMap: ->
      map = new (google.maps.Map)(document.getElementById('map'),
        center:
          lat: 28.601923
          lng: -81.2005395
        zoom: 15)

  }

################################################################
################# Initialize ###################################

  init()


]
