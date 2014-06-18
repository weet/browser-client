MeetingsShowView = Ember.View.extend(

  didInsertElement: ->
    json = JSON.parse(@get('controller.model.geojsonResult'))
    features = topojson.feature(json, json.objects.counties)
    canvasFunction = (extent, resolution, pixelRatio, size, projection) ->
      canvasWidth = size[0]
      canvasHeight = size[1]
      canvas = d3.select(document.createElement("canvas"))
      canvas.attr("width", canvasWidth).attr "height", canvasHeight
      context = canvas.node().getContext("2d")
      d3Projection = d3.geo.mercator().scale(1).translate([ 0, 0 ])
      d3Path = d3.geo.path().projection(d3Projection)
      pixelBounds = d3Path.bounds(features)
      pixelBoundsWidth = pixelBounds[1][0] - pixelBounds[0][0]
      pixelBoundsHeight = pixelBounds[1][1] - pixelBounds[0][1]
      geoBounds = d3.geo.bounds(features)
      geoBoundsLeftBottom = ol.proj.transform(geoBounds[0], "EPSG:4326", projection)
      geoBoundsRightTop = ol.proj.transform(geoBounds[1], "EPSG:4326", projection)
      geoBoundsWidth = geoBoundsRightTop[0] - geoBoundsLeftBottom[0]
      geoBoundsWidth += ol.extent.getWidth(projection.getExtent())  if geoBoundsWidth < 0
      geoBoundsHeight = geoBoundsRightTop[1] - geoBoundsLeftBottom[1]
      widthResolution = geoBoundsWidth / pixelBoundsWidth
      heightResolution = geoBoundsHeight / pixelBoundsHeight
      r = Math.max(widthResolution, heightResolution)
      scale = r / (resolution / pixelRatio)
      center = ol.proj.transform(ol.extent.getCenter(extent), projection, "EPSG:4326")
      d3Projection.scale(scale).center(center).translate [ canvasWidth / 2, canvasHeight / 2 ]
      d3Path = d3Path.projection(d3Projection).context(context)
      d3Path features
      context.stroke()
      canvas[0][0]

    layer = new ol.layer.Image(source: new ol.source.ImageCanvas(
      canvasFunction: canvasFunction
      projection: "EPSG:3857"
    ))
    @get('controller.controllers.application.map').addLayer layer
)

`export default MeetingsShowView`