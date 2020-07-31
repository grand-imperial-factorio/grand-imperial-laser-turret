local laser_beam_blend_mode = "additive"

function make_laser_beam(sound)
  local result =
  {
    type = "beam",
    flags = {"not-on-map"},
    width = 2,
    damage_interval = 5,
    random_target_offset = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = { amount = 1000, type = "laser"}
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 12,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 1300, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "big-explosion"
                  }
                }
              }
            }
          }
        }
      }
    },
    head =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-body.png",
      flags = {"mipmap"},
      line_length = 8,
      width = 64,
      height = 12,
      frame_count = 8,
      scale = 2,
      animation_speed = 0.5,
      blend_mode = laser_beam_blend_mode
    },
    tail =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-end.png",
      flags = { "no-crop", "mipmap" },
      width = 110,
      height = 62,
      frame_count = 8,
      shift = util.by_pixel(11.5, 1),
      scale = 2,
      animation_speed = 0.5,
      blend_mode = laser_beam_blend_mode
    },
    body =
    {
      {
        filename = "__base__/graphics/entity/laser-turret/hr-laser-body.png",
        flags = {"mipmap"},
        line_length = 8,
        width = 64,
        height = 12,
        frame_count = 8,
        scale = 2,
        animation_speed = 0.5,
        blend_mode = laser_beam_blend_mode
      }
    }
  }

  if sound then
    result.working_sound =
    {
      {
        filename = "__base__/sound/fight/electric-beam.ogg",
        volume = 2.0
      }
    }
    result.name = "adikings-big-laser-beam"
  else
    result.name = "adikings-big-laser-beam-no-sound"
  end
  return result;
end

data:extend(
{
  make_laser_beam(true)
}
)