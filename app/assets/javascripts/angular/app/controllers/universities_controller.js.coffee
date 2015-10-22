zombieBox.controller 'UniversitiesController', ['$scope', '$http', 'PostsService', '$location', '$pusher', '$sce', ($scope, $http, PostsService, $location, $pusher, $sce) ->

################################################################
############## Initial Page Load / Reset #######################

  init = ->
    $scope.requestControl.getUniversities()

################################################################
############## Other Initializers ##############################


################################################################
################# Request Control ##############################

  $scope.requestControl = {

    universities: []

    getUniversities: ->
      debugger

  }

################################################################
################# Initialize ###################################

  init()


]
