minetest.register_node(tm.."port",{

    description = "Port",
    tiles = {"devtex.png"},
    drawtype = "mesh",
    paramtype = "light",
    mesh = "port.obj",
    sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1},
    on_construct = function (pos)
    minetest.get_node_timer(pos):start(0.5)
    end,
    on_timer = function(pos)
    end,
        
    on_punch = function(pos)
        minetest.set_node(pos, {name = tm.."port_occ"})
    end

})

minetest.register_node(tm.."port_occ",{

    description = "Occupied Port",
    tiles = {"devtex2.png"},
    drawtype = "mesh",
    paramtype = "light",
    sunlight_propagates = true,
    mesh = "port_occ.obj",
    groups = {oddly_breakable_by_hand = 1},
    on_punch = function(pos)
        minetest.set_node(pos, {name = tm.."port"})
    end,
    on_construct = function (pos)
        minetest.get_node_timer(pos):start(0.5)
    end,
    on_timer = function(pos)
        local ppos,ppos2 = {x = pos.x, y = pos.y, z = pos.z},{x = pos.x, y = pos.y, z = pos.z}
        local rad = 26
        for n = 1, rad, 1 do

            if(n < rad)then
                cf.portalBuild(ppos, rad)
                ppos.y = pos.y + n
                ppos2.y = pos.y - n
                cf.portalBuild(ppos2, rad)
            elseif(n >= rad)then
                cf.portalBuild(ppos,rad,true)
                cf.portalBuild(ppos2,rad,true)
            else end
        end
        minetest.get_node_timer(pos):start(0.5)

    end,

})

