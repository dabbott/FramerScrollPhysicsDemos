
outerLayer = new Layer width:640, height:1136, backgroundColor: 'none'
outerLayer.center()

iconLayer = new Layer width:256, height:256, image:"images/framer-icon.png"

iconLayer.draggable.inertialScroll = true
iconLayer.draggable.maxDragFrame = outerLayer

iconLayer.center()
