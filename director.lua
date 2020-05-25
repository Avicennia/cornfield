

minetest.register_node(tm.."director",{

    description = "Director",
    tiles = {"glass.png"},
    paramtype = "light",
    paramtype2 = "facedir",
    drawtype = "mesh",
    sunlight_propagates = true,
    mesh = "director.obj",
    groups = {oddly_breakable_by_hand = 1},
    on_punch = function(pos)
        minetest.remove_node(pos)
    end

})
minetest.register_node(tm.."director_charged",{

    description = "Director",
    tiles = {"glass.png^nc_optics_port_active.png"},
    paramtype = "light",
    paramtype2 = "facedir",
    drawtype = "mesh",
    sunlight_propagates = true,
    mesh = "director.obj",
    groups = {oddly_breakable_by_hand = 1, cf_charge = 1},
    on_construct = function(pos)
        local node = minetest.get_node(pos)
        local face = nodecore.facedirs[node.param2]
        local ahe = vector.add(face.k, pos)
        local tn = minetest.get_node(ahe)
        local out_b = vector.add(vector.multiply(face.k, {x = -1, y = 1, z = -1}), pos)
        local nt = minetest.get_node(out_b)

        cf.spark1({x = pos.x, y = pos.y, z = pos.z})
        if(minetest.get_node_group(tn.name, "cf_charge") > 0) then
        local meta = minetest.get_meta(ahe)
        local mmeta = minetest.get_meta(pos)
        meta:set_int("cf_charge", meta:get_int("cf_charge") + minetest.registered_nodes[nt.name]["light_source"])

        else end
        minetest.after(0.1, function() minetest.set_node(pos, {name = tm.."director", param2 = minetest.get_node(pos).param2}) end)
    end,
    on_punch = function(pos)
        minetest.remove_node(pos)
        end

})

nodecore.register_limited_abm({
    label = "Lens focusing to Director",
    interval = 0.1,
    chance = 1,
    nodenames = {tm .. "director"},
    action = function(pos, node)
        local face = nodecore.facedirs[node.param2]
        local out_f = vector.add(face.k, pos)
        local out_b = vector.add(vector.multiply(face.k, {x = -1, y = 1, z = -1}), pos)
        local tn = minetest.get_node(out_b)
        local nt = minetest.get_node(out_f)
        local tdef = minetest.registered_items[tn.name] or {}
        if(minetest.registered_nodes[tn.name]["light_source"] > 0)then
            minetest.set_node(pos, {name = tm.."director_charged", param2 = minetest.get_node(pos).param2})
            local meta = minetest.get_meta(pos)
            --meta:set_int("cf_charge", meta:get_int("cf_charge") + minetest.registered_nodes[tn.name]["light_source"])
        else minetest.chat_send_all(minetest.registered_nodes[tn.name]["light_source"]) end
    end
})

