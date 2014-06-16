MeetingNewController = Ember.Controller.extend(

  actions:
    submit: (event, view) ->
      @get('model').save().then(((response) =>
        @transitionTo('meeting', @content)
      ),
      ((response) =>
        console.log(response.errors)
      ))
)

`export default MeetingNewController`