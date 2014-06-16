`import UserCoordinate from 'appkit/models/user-coordinate'`

Meeting = DS.Model.extend(
  userCoordinates: DS.hasMany('user-coordinate')

  created: DS.attr('date')
  geojsonResult: DS.attr('string')
  name: DS.attr('string')
)

`export default Meeting`