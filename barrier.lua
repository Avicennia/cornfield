



minetest.register_node(tm.."barrier",{

    description = "Barrier",
    tiles = {"detail.png","barrier.png"},
    drawtype = "glasslike_framed",
    --mesh = "director.obj",
    groups = {oddly_breakable_by_hand = 1, cf_barrier = 1},
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
        frames_h = 14,
        frame_length = 0.3,}
    }},
    groups = {oddly_breakable_by_hand = 1,damage_radiant = 99, cf_barrier = 2},
    light_source = 8,
    on_construct = function(pos)
    minetest.get_meta(pos):set_int("cf_energy", 6)
    end,
    
    --[[on_timer = function(pos)
    local meta = minetest.get_meta(pos)
    meta:set_int("cf_energy", meta:get_int("cf_energy") - 1)
    if(meta:get_int("cf_energy") < 1)then
        minetest.remove_node(pos)
    else end
    end,]]
    on_punch = function(pos)
    
    minetest.chat_send_all(minetest.get_meta(pos):get_int("cf_energy"))
    end

})
