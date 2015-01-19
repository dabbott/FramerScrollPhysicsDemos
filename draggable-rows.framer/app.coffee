
Framer.LayerDraggable.DragThreshold = 20

width = 640
height = 1136

row = 
	width: width
	height: 100
	count: 50
	margin: 100

backgroundLayer = new Layer
	width: width
	height: height
	backgroundColor: 'white'
	
scrollLayer = new Layer
	width: width
	height: row.count * row.height	

for i in [0...row.count]

	rowLayer = new Layer
		width: row.width
		height: row.height
		y: i * row.height
		
	scrollLayer.addSubLayer rowLayer
		
	Utils.labelLayer rowLayer, "Row #{i}"
	rowLayer.style = 'font-size': '36px'

	dragFrame =
		width: row.width * 2 - row.margin
		height: row.height
		x: - row.width + row.margin
		y: i * row.height

	rowLayer.draggable.inertialScroll = true
	rowLayer.draggable.maxDragFrame = dragFrame
	rowLayer.draggable.speedY = 0
	rowLayer.draggable.directionLock = true
	rowLayer.draggable.multipleDraggables = true

	rowLayer.on Events.DirectionLock, => scrollLayer.draggable.enabled = false
	rowLayer.on Events.DragEnd,       => scrollLayer.draggable.enabled = true

scrollLayer.draggable.inertialScroll = true
scrollLayer.draggable.maxScrollFrame = backgroundLayer
scrollLayer.draggable.speedX = 0
scrollLayer.draggable.directionLock = true
scrollLayer.draggable.multipleDraggables = true

scrollLayer.on Events.DirectionLock, => rowLayer.draggable.enabled = false for rowLayer in scrollLayer.subLayers
scrollLayer.on Events.DragEnd,       => rowLayer.draggable.enabled = true  for rowLayer in scrollLayer.subLayers
