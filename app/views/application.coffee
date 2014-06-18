ApplicationView = Ember.View.extend(

  didInsertElement: ->
    map = new ol.Map(
      target: "map"
      layers: [ new ol.layer.Tile(source: new ol.source.Stamen({
        layer: 'watercolor'
      })) ]
      view: new ol.View2D(
        center: ol.proj.transform([ -97.75, 30.25 ], "EPSG:4326", "EPSG:3857")
        zoom: 5
      )
    )
    @set('controller.map', map)
)

`export default ApplicationView`