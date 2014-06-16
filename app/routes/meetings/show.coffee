MeetingsShowRoute = Ember.Route.extend(

  model: (params) ->
    @store.find('meeting', params.id)
)

`export default MeetingsShowRoute`