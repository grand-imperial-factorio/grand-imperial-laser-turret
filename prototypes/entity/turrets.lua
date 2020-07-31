local tintr = 1
local tintg = 0.91
local tintb = 0.5

function laser_turret_extension(inputs)
return
{
  filename = "__base__/graphics/entity/laser-turret/laser-turret-raising.png",
  priority = "medium",
  width = 66,
  height = 64,
  frame_count = inputs.frame_count and inputs.frame_count or 15,
  line_length = inputs.line_length and inputs.line_length or 0,
  run_mode = inputs.run_mode and inputs.run_mode or "forward",
  axially_symmetrical = false,
  direction_count = 4,
  shift = util.by_pixel(0, -88),
  tint = {r = tintr, g = tintg, b = tintb, a = 1},
  hr_version =
  {
    filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-raising.png",
    priority = "medium",
    width = 130,
    height = 126,
    frame_count = inputs.frame_count and inputs.frame_count or 15,
    line_length = inputs.line_length and inputs.line_length or 0,
    run_mode = inputs.run_mode and inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 4,
    shift = util.by_pixel(0, -88),
	tint = {r = tintr, g = tintg, b = tintb, a = 1},
    scale = 1.5
  }
}
end

function laser_turret_extension_shadow(inputs)
return
{
  filename = "__base__/graphics/entity/laser-turret/laser-turret-raising-shadow.png",
  width = 92,
  height = 50,
  frame_count = inputs.frame_count and inputs.frame_count or 15,
  line_length = inputs.line_length and inputs.line_length or 0,
  run_mode = inputs.run_mode and inputs.run_mode or "forward",
  axially_symmetrical = false,
  direction_count = 4,
  draw_as_shadow = true,
  shift = util.by_pixel(140, 9),
  hr_version =
  {
    filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-raising-shadow.png",
    width = 182,
    height = 96,
    frame_count = inputs.frame_count and inputs.frame_count or 15,
    line_length = inputs.line_length and inputs.line_length or 0,
    run_mode = inputs.run_mode and inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 4,
    draw_as_shadow = true,
    shift = util.by_pixel(140, 7.5),
    scale = 1.5
  }
}
end

function laser_turret_shooting()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting.png",
    line_length = 20,
    width = 64,
    height = 60,
    frame_count = 1,
    direction_count = 64,
    shift = util.by_pixel(0, -98),
	tint = {r = tintr, g = tintg, b = tintb, a = 1},
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-shooting.png",
      line_length = 8,
      width = 126,
      height = 120,
      frame_count = 1,
      direction_count = 64,
      shift = util.by_pixel(0, -98),
	  tint = {r = tintr, g = tintg, b = tintb, a = 1},
      scale = 1.5
    }
  }
end

function laser_turret_shooting_glow()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-light.png",
    line_length = 8,
    width = 62,
    height = 58,
    frame_count = 1,
    direction_count = 64,
    blend_mode = "additive",
    shift = util.by_pixel(0, -98),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-shooting-light.png",
      line_length = 8,
      width = 122,
      height = 116,
      frame_count = 1,
      direction_count = 64,
      shift = util.by_pixel(-0.5, -98),
      blend_mode = "additive",
      scale = 1.5
    }
  }
end

function laser_turret_shooting_shadow()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-shadow.png",
    line_length = 8,
    width = 86,
    height = 46,
    frame_count = 1,
    direction_count = 64,
    draw_as_shadow = true,
    shift = util.by_pixel(153, 6),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-shooting-shadow.png",
      line_length = 8,
      width = 170,
      height = 92,
      frame_count = 1,
      direction_count = 64,
      draw_as_shadow = true,
      shift = util.by_pixel(152.5, 7.5),
      scale = 1.5
    }
  }
end

data:extend (
{
{
    type = "electric-turret",
    name = "grand-imperial-laser-turret",
    icon = "__GrandImperialLaserTurret__/graphics/icons/grand-imperial-laser-turret.png",
    icon_size = 32,
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = { mining_time = 5, result = "grand-imperial-laser-turret" },
    max_health = 100000,
    corpse = "medium-remnants",
    collision_box = {{ -2.7, -2.7}, {2.7, 2.7}},
    selection_box = {{ -3, -3}, {3, 3}},
    rotation_speed = 0.02,
    preparing_speed = 0.08,
    dying_explosion = "medium-explosion",
    folding_speed = 0.08,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1280000kJ",
      input_flow_limit = "1000000kW",
      drain = "3500kW",
      usage_priority = "primary-input"
    },
    folded_animation =
    {
      layers =
      {
        laser_turret_extension{frame_count=1, line_length = 1},
        laser_turret_extension_shadow{frame_count=1, line_length=1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        laser_turret_extension{},
        laser_turret_extension_shadow{}
      }
    },
    prepared_animation =
    {
      layers =
      {
        laser_turret_shooting(),
        laser_turret_shooting_shadow()
      }
    },
    --attacking_speed = 0.1,
    energy_glow_animation = laser_turret_shooting_glow(),
    folding_animation =
    {
      layers =
      {
        laser_turret_extension{run_mode = "backward"},
        laser_turret_extension_shadow{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
          priority = "high",
          width = 70,
          height = 52,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, 2),
		  tint = {r = tintr, g = tintg, b = tintb, a = 1},
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base.png",
            priority = "high",
            width = 138,
            height = 104,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(-0.5, 2),
			tint = {r = tintr, g = tintg, b = tintb, a = 1},
            scale = 1.5
          }
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-shadow.png",
          flags = { "mask" },
          line_length = 1,
          width = 66,
          height = 42,
          draw_as_shadow = true,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(6, 3),
		  tint = {r = tintr, g = tintg, b = tintb, a = 1},
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base-shadow.png",
            flags = { "mask" },
            line_length = 1,
            width = 132,
            height = 82,
            draw_as_shadow = true,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(6, 3),
			tint = {r = tintr, g = tintg, b = tintb, a = 1},
            scale = 1.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

    attack_parameters =
    {
      type = "beam",
      cooldown = 20,
      range = 1000,
      source_direction_count = 128,
      source_offset = {0, -3.223489},
      damage_modifier = 2,
      ammo_type =
      {
        category = "laser-turret",
        energy_consumption = "192000kJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
			type = "instant",
			target_effects =
			{
				{
					type = "create-entity",
					entity_name = "big-explosion"
				},
				{
					type = "create-entity",
					entity_name = "laser-bubble"
				},
			},
            type = "beam",
            beam = "adikings-big-laser-beam",
            max_length = 1000,
            duration = 20,
            source_offset = {-0.5, -3.3 }
          }
        },
		},
	},
	call_for_help_radius = 40
}
}
)