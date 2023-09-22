% https://minecraft.fandom.com/ru/wiki/%D0%97%D0%B5%D0%BB%D1%8C%D0%B5%D0%B2%D0%B0%D1%80%D0%B5%D0%BD%D0%B8%D0%B5

ingredient(hell_growth_seeds).
ingredient(redstone).
ingredient(glowstone).

ingredient(lava_cream).
ingredient(gust_tear).
ingredient(sugar).
ingredient(gold_watermelon).
ingredient(fire_dust).
ingredient(gold_carrot).
ingredient(needlefish).
ingredient(phantom_membrane).
ingredient(turtle_shell).
ingredient(rabbits_foot).
ingredient(spider_eye).

potion(water_potion).
potion(crude_potion).
potion(unmarkable_potion).
potion(health_potion).
potion(fire_resistance_potion).
potion(regeneration_potion).
potion(power_potion).
potion(acceleration_potion).
potion(night_vision_potion).
potion(underwater_breath_potion).
potion(slow_fall_potion).
potion(turtle_power_potion).
potion(bounce_potion).
potion(poison_potion).
potion().

crude_potion(hell_growth_seeds, water_potion).
unmarkable_potion(redstone, water_potion).
thick_potion(glowstone, water_potion).

health_potion(gold_watermelon, crude_potion).
fire_resistance_potion(lava_cream, crude_potion).
regeneration_potion(gust_tear, crude_potion).
power_potion(fire_dust, crude_potion).
acceleration_potion(sugar, crude_potion).
night_vision_potion(gold_carrot, crude_potion).
underwater_breath_potion(needlefish, crude_potion).
slow_fall_potion(phantom_membrane, crude_potion).
turtle_power_potion(turtle_shell, crude_potion).
bounce_potion(rabbits_foot, crude_potion).

poison_potion(spider_eye, crude_potion).


is_explosive(Potion) :- 
    potion(Potion),
    not(Potion = water_potion), 
    not(Potion = crude_potion), 
    not(Potion = unmarkable_potion).