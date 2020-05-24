minetest.register_node(tm.."controller", {
	tiles = {"nc_lode_annealed.png"},
	drawtype = "nodebox",
    paramtype = "light",
	node_box = {
        type = "fixed",
		fixed = {
            {0.3125, -0.4375, -0.375, 0.375, 0.5, -0.25}, -- NodeBox1
			{-0.375, -0.4375, -0.375, -0.3125, 0.5, -0.25}, -- NodeBox2
			{-0.375, -0.4375, 0.25, -0.3125, 0.5, 0.375}, -- NodeBox3
			{0.3125, -0.4375, 0.25, 0.375, 0.5, 0.375}, -- NodeBox4
			{-0.3125, -0.5, -0.25, 0.3125, 0.5, 0.25}, -- NodeBox25
			{0.375, -0.5, -0.375, 0.4375, -0.375, 0.375}, -- NodeBox26
			{-0.4375, -0.5, -0.375, -0.375, -0.375, 0.375}, -- NodeBox28
			{-0.375, -0.5, -0.4375, 0.375, -0.375, -0.375}, -- NodeBox29
			{-0.375, -0.5, 0.375, 0.375, -0.375, 0.4375}, -- NodeBox30
			{-0.375, -0.3125, 0.375, 0.375, -0.1875, 0.4375}, -- NodeBox31
			{-0.375, -0.3125, -0.4375, 0.375, -0.1875, -0.375}, -- NodeBox32
			{-0.375, -0.125, -0.4375, 0.375, 0, -0.375}, -- NodeBox33
			{-0.375, -0.125, 0.375, 0.375, 0, 0.4375}, -- NodeBox34
			{-0.375, 0.0625, 0.375, 0.375, 0.1875, 0.4375}, -- NodeBox35
			{-0.375, 0.0625, -0.4375, 0.375, 0.1875, -0.375}, -- NodeBox36
			{-0.375, 0.25, -0.4375, 0.375, 0.375, -0.375}, -- NodeBox37
			{-0.375, 0.25, 0.375, 0.375, 0.375, 0.4375}, -- NodeBox38
			{-0.375, 0.4375, 0.375, 0.375, 0.5, 0.4375}, -- NodeBox39
			{-0.375, 0.4375, -0.4375, 0.375, 0.5, -0.375}, -- NodeBox40
			{0.375, -0.25, -0.375, 0.4375, -0.125, 0.375}, -- NodeBox41
			{-0.4375, -0.25, -0.375, -0.375, -0.125, 0.375}, -- NodeBox42
			{-0.4375, -0.0625, -0.375, -0.375, 0.0625, 0.375}, -- NodeBox43
			{0.375, -0.0625, -0.375, 0.4375, 0.0625, 0.375}, -- NodeBox44
			{0.375, 0.125, -0.375, 0.4375, 0.25, 0.375}, -- NodeBox45
			{-0.4375, 0.125, -0.375, -0.375, 0.25, 0.375}, -- NodeBox46
			{-0.4375, 0.3125, -0.375, -0.375, 0.4375, 0.375}, -- NodeBox47
			{0.375, 0.3125, -0.375, 0.4375, 0.4375, 0.375}, -- NodeBox48
		}
    },
    groups = {cracky = 5, cf_charge = 2},
    on_punch = function(pos)
        --minetest.set_node(pos, {name = tm .. "controller", param2 = minetest.get_node(pos).param2 + 1})
    end,
    on_construct = function(pos)
    
    minetest.get_meta(pos):set_int("cf_charge",0)

    end
})

