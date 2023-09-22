value(0).
value(1).
value(2).
value(3).
value(4).
value(5).
value(6).
value(7).
value(8).
value(9).
value(rotate).
value(take_two).
value(skip_turn).

color(red).
color(blue).
color(green).
color(yellow).

card(wild).
card(wild_take_four).
card(wild_change_hand).

beat(wild, _).
beat(wild_take_four, _).
beat(wild_change_hand, _).

card(X, Y) :- value(X), color(Y). 

beat(ValueX, ColorX, ValueY, ColorY) :- 
    card(ValueX, ColorX), card(ValueY, ColorY),
    (
        ValueX = ValueY;
        ColorX = ColorY
    ).