collegeEvent.controller 'EventsShowController', ['$scope', '$http', 'EventsService', '$location', '$pusher', '$sce', ($scope, $http, EventsService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    setUpLatLng()

    $scope.requestControl.initMap()

    setUpEventId()

    $scope.requestControl.getEventComments()

################################################################
############## Other Initializers ##############################

  setUpEventId = ->
    if $('#event_id') && $('#event_id').length > 0 && $('#event_id')[0].value
      $scope.requestControl.event_id = parseInt($('#event_id')[0].value, 10)

  setUpLatLng = ->

    if $('#lat') && $('#lat').length > 0 && $('#lat')[0].value
      $scope.requestControl.lat = parseFloat($('#lat')[0].value, 10)

    if $('#lng') && $('#lng').length > 0 && $('#lng')[0].value
      $scope.requestControl.lng = parseFloat($('#lng')[0].value, 10)

################################################################
################# Request Control ##############################

  $scope.loaderControl = {

    isLoading: false

  }

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    comments: []

    event_id: null

    lat: null

    lng: null

    initMap: ->
      map = new (google.maps.Map)(document.getElementById('map'),
        center:
          lat: this.lat
          lng: this.lng
        zoom: 16)

      marker = new (google.maps.Marker)(
        position: { lat: this.lat, lng: this.lng }
        map: map
        title: 'Hello World!')

    getEventComments: ->
      if this.event_id && this.event_id > 0
        EventsService.getEventComments.query({ event_id: this.event_id }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.comments = responseData.comments
        )

  }

################################################################
################# Initialize ###################################

  init()


]
