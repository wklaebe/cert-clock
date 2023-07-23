util.no_globals()

gl.setup(NATIVE_WIDTH, NATIVE_HEIGHT)

node.alias "base"

function node.render()
    resource.render_child("textclock"):draw(0,0,NATIVE_WIDTH,NATIVE_HEIGHT)
end
