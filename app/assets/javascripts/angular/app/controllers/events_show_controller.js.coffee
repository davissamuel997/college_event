collegeEvent.controller 'EventsShowController', ['$scope', '$http', 'OrganizationsService', '$location', '$pusher', '$sce', ($scope, $http, OrganizationsService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    setUpLatLng()

    $scope.requestControl.initMap()

################################################################
############## Other Initializers ##############################

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

  }

################################################################
################# Initialize ###################################

  init()


]
