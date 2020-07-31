data:extend(
{
  {
    type = "technology",
    name = "grand-imperial-laser-turrets",
    icon_size = 128,
    icon = "__GrandImperialLaserTurret__/graphics/technology/grand-imperial-laser-turret.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "grand-imperial-laser-turret"
      }
    },
    prerequisites = {"laser-turrets", "military-4",},
    unit =
    {
      count = 25000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
		{"chemical-science-pack", 1},
		{"utility-science-pack", 1},
      },
      time = 6
    },
    order = "a-j-b"
  },
}
)