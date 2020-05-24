local thismod = minetest.get_current_modname()
local modpath = minetest.get_modpath(thismod)
tm = thismod..":"
cf = {}


dofile(modpath.."/visuals.lua")
dofile(modpath.."/director.lua")
dofile(modpath.."/corncrystal.lua")
dofile(modpath.."/barrier.lua")
dofile(modpath.."/dock.lua")
dofile(modpath.."/controller.lua")
dofile(modpath.."/vestibule.lua")