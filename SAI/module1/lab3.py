from pyswip import Prolog

prolog = Prolog()
prolog.consult("lab1.pro")

def query(msg : str) -> bool:
    return list(prolog.query(msg))

def validate_input(ingredients : list[str]):
    if not query(f"potion({ingredients[0]})"):
        print("First ingredient must be potion")
        exit()

    for i in range(1, len(ingredients)):
        if not query(f"ingredient({ingredients[i]})") and not query(f"special_ingredient({ingredients[i]})"):
            print(f"{ingredients[i]} is not ingredient and cannot be used")
            exit()

def get_all_potions() -> list[str]:
    potion_list = []
    for result in list(prolog.query("potion(X)")):
        potion_list.append(result["X"])
    return potion_list

def get_all_base_potions() -> list[str]:
    base_potion_list = []
    for result in list(prolog.query("base_potion(X)")):
        base_potion_list.append(result["X"])
    return base_potion_list

print("Input your ingredients (use space as separator): ", end = "")

ingredients = input().split(" ")

validate_input(ingredients)

potions = get_all_potions()

# remove all base potions
for base_potion in get_all_base_potions():
    potions.remove(base_potion)

effect = ""

for i in range(len(ingredients)-1):
    new_potion = ""

    if i == len(ingredients)-2 and query(f"special_ingredient({ingredients[i+1]})"): # check for special effect
        new_potion = ingredients[i]
        match ingredients[i+1]:
            case "redstone":
                if not query(f"can_be_boosted_by_redstone({new_potion})"):
                    print(f"{new_potion} cannot be boosted by redstone")
                    exit()
                effect = "duration boost"
            case "glowstone":
                if not query(f"can_be_boosted_by_glowstone({new_potion})"):
                    print(f"{new_potion} cannot be boosted by glowstone")
                    exit()
                effect = "power boost"
            case "dragon_breath":
                if not query(f"can_be_settling({new_potion})"):
                    print(f"{new_potion} cannot be boosted by dragon breath")
                    exit()
                effect = "settling (also need funeral for explosive effect before)"
            case "cooked_spider_eye":
                if not query(f"can_be_inverted_by_cooked_spider_eye({new_potion})"):
                    print(f"{new_potion} cannot be inverted by cooked spider eye")
                    exit()
                effect = "inverted effect"
            case "funeral":
                if not query(f"can_be_explosive({new_potion})"):
                    print(f"{new_potion} cannot be boosted by funeral")
                    exit()
                effect = "explosive effect"
            case _:
                print("Not found any effect for "+ingredients[i+1])
                exit()
    else:
        for potion in potions:
            if query(f"{potion}({ingredients[i]}, {ingredients[i+1]})") or query(f"{potion}({ingredients[i+1]}, {ingredients[i]})"):
                new_potion = potion
                break
        
        if new_potion == "":
            print(f"You cannot create potion with {ingredients[i]} and {ingredients[i+1]}")
            exit()
        
    ingredients[i] = ""
    ingredients[i+1] = new_potion

print(f"Your potion: {ingredients[len(ingredients)-1]} ", end="")
if effect == "":
    print("without any effect")
else:
    print("with "+effect)