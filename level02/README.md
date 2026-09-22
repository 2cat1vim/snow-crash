# Level 02 → Level 03

**Mot de passe du niveau :** flag de `level01`

## Cible
`/opt/snowcrash/level02/kourier`

## Vulnérabilité
Le flag est présent en dur dans les chaînes du binaire, juste après le format
d'erreur `open %s: %s`.

## Exploitation
```bash
strings /opt/snowcrash/level02/kourier | grep -A 1 "open %s: %s"
```

## Flag
```
qi0mauch9ahksha8b6dfe3p0kq
```
