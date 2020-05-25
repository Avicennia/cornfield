--FUNCTIONS--

function cf.portalBuild(pos, rad, is_fill)
    if(not is_fill)then
    local poses = {{x = pos.x + rad, y = pos.y, z = pos.z + rad},
    {x = pos.x - rad, y = pos.y, z = pos.z - rad},
    {x = pos.x - rad, y = pos.y, z = pos.z + rad},
    {x = pos.x + rad, y = pos.y, z = pos.z - rad}}

    for n = 1, 4, 1 do
    minetest.set_node(poses[n], {name = tm.."barrier_a"})
    end
    
    local pool = {2,2,-1,-3}
    for n = 1, 4, 1 do
    local no = pool[n] + n
    
    local ar = minetest.find_nodes_in_area(poses[n],poses[no], "air")
    if(ar and #ar >= 1)then
        for a = 1, #ar, 1 do
        minetest.set_node(ar[a], {name = tm.."barrier_a"})
        end
    else end


    
    end


elseif(is_fill == true)then -- For Roofing things, like Jaycee does.
        local ar = minetest.find_nodes_in_area({x = pos.x + rad, y = pos.y, z = pos.z + rad},{x = pos.x - rad, y = pos.y, z = pos.z - rad}, "air")
        if(ar and #ar >= 1)then
            for a = 1, #ar, 1 do
            minetest.set_node(ar[a], {name = tm.."barrier_a"})
            end
        else end
    else
    end

end

local entomb = function(pos, rad)
    local ppos,ppos2 = {x = pos.x, y = pos.y, z = pos.z},{x = pos.x, y = pos.y, z = pos.z}
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
end

------FUNCTIONS-------

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


local function barrier_wax(pos, rad)

    local function support_field(pos, cost)
        local below = {x = pos.x, y = pos.y - 1, z = pos.z}-- or cf.nullvector
        if(below and cost)then
            local meta = minetest.get_meta(below)
            meta:set_int("cf_charge", meta:get_int("cf_charge") - cost)
        else end
    end


    local function clear_field(area)
        if(area)then
            for n = 1, #area, 1 do
                minetest.remove_node(area[n])
            end
        else end
    end

    local nodes = minetest.find_nodes_in_area({x=pos.x-rad,y=pos.y-rad,z=pos.z-rad},{x=pos.x+rad,y=pos.y+rad,z=pos.z+rad}, "group:cf_barrier")
    local cost = nodes and #nodes/100 or nil
    local charge = minetest.get_meta({x = pos.x, y = pos.y - 1, z = pos.z}):get_int("cf_charge")
    local nb = cost and cost <= charge and true or nil
    if(nb)then
        support_field(pos,cost)
    else clear_field(nodes)
    end
end



minetest.register_node(tm.."port_occ",{

    description = "Occupied Port",
    tiles = {"devtex2.png"},
    drawtype = "mesh",
    paramtype = "light",
    sunlight_propagates = true,
    mesh = "port_occ.obj",
    groups = {oddly_breakable_by_hand = 1},
    on_punch = function(pos,_,puncher)
    local rad = 26
        if(puncher:get_player_control().sneak == false)then
        local thresh = 10
        local below = {x=pos.x,y=pos.y-1,z=pos.z}
        if(minetest.get_meta(below):get_int("cf_charge") >= thresh)then

        
        minetest.get_node_timer(pos):start(0.5)
    else minetest.chat_send_all("why")
    end
elseif(puncher:get_player_control().sneak == true)then
    minetest.get_meta(pos):set_int("cf_radius", rad)
else
end
    end,
    on_construct = function (pos)
        local rad = 26
        minetest.get_meta(pos):set_int("cf_radius", rad)
        minetest.get_node_timer(pos):start(0.5)
    end,
    on_timer = function(pos)
        local meta = minetest.get_meta(pos)
        local rad = meta:get_int("cf_radius")
        
        barrier_wax(pos,rad)
        minetest.get_node_timer(pos):start(3.5)
    end,
    on_rightclick = function(pos)
    minetest.remove_node(pos)
    end

})

minetest.register_abm(
{
    label = "Barrier Filling",
    
    nodenames = {tm.."port_occ"},
    
    neighbors = {"air"},
   
    interval = 1.0,
    chance = 1,
    
    catch_up = false,
    
    action = function(pos)
        local meta = minetest.get_meta(pos)
            entomb(pos,minetest.get_meta(pos):get_int("cf_radius"))
    end
})