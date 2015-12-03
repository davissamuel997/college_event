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

    commentBeingEdited: null

    currentUser: null

    events: []

    isEditingComment: false

    newComment: null

    scopedEventIndex: null

    createEventComment: (eventIndex) ->
      this.scopedEventIndex = eventIndex

      event = this.events[this.scopedEventIndex]

      if this.newComment && this.newComment.length > 0 && event.event_id && event.event_id > 0
        EventsService.createEventComment.query({ event_id: event.event_id, comment_text: this.newComment, rating: this.rating }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.events[$scope.requestControl.scopedEventIndex].comments = responseData.comments

            $scope.requestControl.scopedEventIndex = null

            $scope.requestControl.newComment = null
            $scope.requestControl.rating = null  
        )

    editComment: (comment) ->
      this.commentBeingEdited = comment

      this.isEditingComment = true

    getEvents: ->
      EventsService.getEvents.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.events      = responseData.events
          $scope.requestControl.currentUser = responseData.current_user
      )


    updateEventComment: (commentIndex, eventIndex) ->
      if this.commentBeingEdited && this.commentBeingEdited.comment_id && this.commentBeingEdited.comment_id > 0 && this.commentBeingEdited.text && this.commentBeingEdited.text.length > 0 && this.commentBeingEdited.rating && parseInt(this.commentBeingEdited.rating, 10) > 0
        this.eventIndex = eventIndex

        EventsService.updateComment.query({ comment_id: this.commentBeingEdited.comment_id, text: this.commentBeingEdited.text, rating: this.commentBeingEdited.rating }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.events[$scope.requestControl.eventIndex].comments = responseData.comments

            $scope.requestControl.commentBeingEdited = null
            $scope.requestControl.isEditingComment = false
        )

  }

################################################################
################# Initialize ###################################

  init()


]
