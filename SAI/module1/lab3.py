from pyswip import Prolog

prolog = Prolog()
prolog.consult("lab1.pro")

def query(msg : str) -> bool:
    return bool(list(prolog.query(msg)))

print(query("potion(water_potion)"))