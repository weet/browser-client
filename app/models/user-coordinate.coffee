`import Meeting from 'appkit/models/meeting'`

UserCoordinate = DS.Model.extend(
  meeting: DS.belongsTo('meeting')

  created: DS.attr('date')
  name: DS.attr('string')
  point: DS.attr('string')
  transportationType: DS.attr('string')
)

`export default UserCoordinate`