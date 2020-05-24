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


------FUNCTIONS-------



minetest.register_node(tm.."barrier",{

    description = "Barrier",
    tiles = {"detail.png","barrier.png"},
    drawtype = "glasslike_framed",
    --mesh = "director.obj",
    groups = {oddly_breakable_by_hand = 1},
    on_punch = function(pos)
    local ppos = {x = pos.x, y = pos.y, z = pos.z}
    local rad = 26
    for n = 1, rad, 1 do

    if(n < rad)then    
    cf.portalBuild(ppos, rad)
    ppos.y = ppos.y + 1
    elseif(n >= rad)then
        cf.portalBuild(ppos,rad,true)
    else end
end
end
})

minetest.register_node(tm.."barrier_a",{

    description = "Barrier",
    drawtype = "glasslike",
    paramtype = "light",
    sunlight_propagates = true,
    tiles = {{ name = "barrier_animated_trans2.png",
    
    animation = {
        type = "vertical_frames",
        aspect_w = 16,
        aspect_h = 16,
        length = 1},
    {
        type = "sheet_2d",
        frames_w = 1,
        frames_h = 19,
        frame_length = 0.3,}
    }},
    groups = {oddly_breakable_by_hand = 1},
    light_source = 8,
    on_punch = function(pos)
    minetest.remove_node(pos)
    end

})