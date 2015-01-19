
Framer.Defaults.Layer.backgroundColor = 'transparent'

width = 640
height = 1136

backgroundLayer = new Layer
	width: width
	height: height
	backgroundColor: 'black'

### CROP BOX & DRAGGABLE IMAGE ###

cropBoxLayer = new Layer 
	width: width
	height: width
	clip: false
	superLayer: backgroundLayer

cropBoxLayer.center()
	
imageLayer = new Layer 
	width: 1224
	height: 1632
	image: "images/streets_of_japan.jpeg"
	
cropBoxLayer.addSubLayer imageLayer
	
imageLayer.draggable.inertialScroll = true
imageLayer.draggable.maxScrollFrame = cropBoxLayer

### CROP OUTLINE & OVERLAYS ###

overlayLayer = new Layer
	width: width
	height: height

cropOutlineLayer = new Layer 
	width: width
	height: width
	superLayer: overlayLayer

cropOutlineLayer.center()
cropOutlineLayer.style = border: '1px solid white'

cropOverlayTop = new Layer 
	width: width
	height: cropOutlineLayer.y
	backgroundColor: 'rgba(0,0,0,0.8)'
	superLayer: overlayLayer
	
instructionsLayer = new Layer
	width: width
	height: 60
	y: cropOutlineLayer.y - 60
	superLayer: overlayLayer
	
instructionsLayer.html = 'Crop your image to a square!'
instructionsLayer.style =
	color: 'white'
	'font-size': '36px'
	'font-weight': '400'
	'font-family': "'Helvetica Neue', Helvetica, Arial, sans-serif"
	'text-align': 'center'

cropOverlayBottom = new Layer 
	width: width
	height: height - cropOutlineLayer.maxY
	y: cropOutlineLayer.maxY
	backgroundColor: 'rgba(0,0,0,0.8)'
	superLayer: overlayLayer
