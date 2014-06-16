MeetingsNewController = Ember.Controller.extend(

  actions:
    submit: (event, view) ->
      @get('model').save().then(((response) =>
        @transitionTo('meetings.show', @content)
      ),
      ((response) =>
        console.log(response.errors)
      ))
)

`export default MeetingsNewController`