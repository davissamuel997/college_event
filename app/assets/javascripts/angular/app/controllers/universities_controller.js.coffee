zombieBox.controller 'UniversitiesController', ['$scope', '$http', 'UniversitiesService', '$location', '$pusher', '$sce', ($scope, $http, UniversitiesService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    $scope.requestControl.getUniversities()

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

    universities: []

    getUniversities: ->
      UniversitiesService.getUniversities.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.universities = responseData.universities
      )

  }

################################################################
################# Initialize ###################################

  init()


]
