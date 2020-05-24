cf.suffuse = function(pos)
    minetest.add_particlespawner({
        amount = 1,
        time = 0.1,
        minpos = {x=pos.x-0.2, y=pos.y-0.4, z=pos.z-0.2},
        maxpos = {x=pos.x+0.2, y=pos.y-0.4, z=pos.z+0.2},
        minvel = {x=0, y=0, z=0},
        maxvel = {x=0, y=0.01, z=0},
        minacc = {x=0, y=0, z=0},
        maxacc = {x=0, y=1, z=0},
        minexptime = 0.1,
        maxexptime = 0.4,
        minsize = 10,
        maxsize = 30,

        collisiondetection = false,
        collision_removal = false,
        vertical = true,
        texture = "smash1.png",
        animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 0.3},
        {
            type = "sheet_2d",
            frames_w = 1,
            frames_h = 18,
            frame_length = 0.6,
        },
        glow = 4
    })
end

cf.spark1 = function(pos)
    local dest = minetest.find_node_near(pos,1,tm.."vestibule")
    if dest then
    local dist = vector.multiply(vector.direction(pos, dest),{x = 2, y = 1, z = 2})
    
    minetest.add_particlespawner({
        amount = 3,
        time = 1,
        minpos = {x=pos.x, y=pos.y + 0.06, z=pos.z},
        maxpos = {x=pos.x, y=pos.y + 0.06, z=pos.z},
        minvel = {x=0, y=0, z=0},
        maxvel = dist,
        minacc = {x=0, y=0, z=0},
        maxacc = {x=0, y=1, z=0},
        minexptime = 0.5,
        maxexptime = 0.5,
        minsize = 0.6,
        maxsize = 1,

        collisiondetection = false,
        collision_removal = false,
        vertical = true,
        texture = "luxion_anim.png",
        animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 0.8},
        {
            type = "sheet_2d",
            frames_w = 1,
            frames_h = 6,
            frame_length = 0.6,
        },
        glow = 4
    })
else end
end

cf.cone = function(pos,tex,r)
    local x, z = pos.x, pos.z
    for i = 1, 360, 4 do
        local ang = i * math.pi / 180
        local ptx, ptz = x + r * math.cos(ang), z + r * math.sin(ang)
  
    minetest.add_particlespawner({
        amount = 1,
        time = 1,
        minpos = {x=ptx, y=pos.y, z=ptz},
        maxpos = {x=ptx, y=pos.y, z=ptz},
        minvel = {x = 0, y =0.6, z = 0},
        maxvel = {x = 0, y=1.0, z= 0},
        minacc = {x = 0, y = 0.7, z = 0},
        maxacc = {x=0, y=0, z=0},
        minexptime = 0.6,
        maxexptime = 1,
        minsize = 0.8,
        maxsize = 1.8,
        animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 0.8},
            {
                type = "sheet_2d",
                frames_w = 1,
                frames_h = 18,
                frame_length = 0.8,
            },
        collisiondetection = true,
        collision_removal = true,
        vertical = true,
        texture = tex,
        glow = 8
    })
end
end