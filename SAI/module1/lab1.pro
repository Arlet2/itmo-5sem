% https://minecraft.fandom.com/ru/wiki/%D0%97%D0%B5%D0%BB%D1%8C%D0%B5%D0%B2%D0%B0%D1%80%D0%B5%D0%BD%D0%B8%D0%B5

% Ingredients for first tier potions

ingredient(hell_growth_seeds).
ingredient(redstone).
ingredient(glowstone).

% ingredients for second tier potions
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
ingredient(cooked_spider_eye).

% first tier potions
potion(water_potion).
potion(crude_potion).
potion(unmarkable_potion).

% positive second tier potions
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
potion(weakness_potion).

% receipts for first tier potions
crude_potion(hell_growth_seeds, water_potion).
unmarkable_potion(redstone, water_potion).
thick_potion(glowstone, water_potion).

% receipts for positive second tier potions
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

% receipts for negative second tier potions
poison_potion(spider_eye, crude_potion).
weakness_potion(cooked_spider_eye, thick_potion).

% Can potion be explosive (can we add funeral)
can_be_explosive(Potion) :- 
    potion(Potion),
    not(Potion = water_potion), 
    not(Potion = crude_potion), 
    not(Potion = unmarkable_potion).

% Can potion be busted with duration
can_be_busted_by_redstone(Potion) :-
    potion(Potion),
    (
        Potion = fire_resistance_potion ;
        Potion = regeneration_potion ;
        Potion = power_potion ;
        Potion = acceleration_potion ;
        Potion = night_vision_potion ;
        Potion = slow_fall_potion ;
        Potion = bounce_potion ;
        Potion = turtle_power_potion ;
        Potion = underwater_breath_potion ;
        Potion = poison_potion ;
        Potion = weakness_potion
    ).

% Can potion be busted with power
can_be_busted_by_glowstone(Potion) :-
    potion(Potion),
    (
        Potion = health_potion ;
        Potion = regeneration_potion ;
        Potion = power_potion ;
        Potion = acceleration_potion ;
        Potion = bounce_potion ;
        Potion = poison_potion
    ).

% Can effect in potion be inverted
can_be_inverted_by_cooked_spider_eye(Potion) :-
    potion(Potion),
    (
        Potion = health_potion ;
        Potion = bounce_potion ;
        Potion = power_potion ;
        Potion = regeneration_potion    
    ).

% Can potion be settling (upgraded by dragon breath)
can_be_settling(Potion) :-
    potion(Potion), can_be_explosive(Potion).