# Level 00 → Level 01

**Mot de passe du niveau :** `level00` (identifiant initial)

## Cible
`/opt/snowcrash/level00/hiro`

## Vulnérabilité
Le flag est stocké en clair dans une section ELF personnalisée nommée
`.flag_data` du binaire. Aucune protection : il suffit de lire la section.

## Exploitation
```bash
readelf -p ".flag_data" /opt/snowcrash/level00/hiro
```
`strings` sur le binaire révèle l'existence de la section `.flag_data`, puis
`readelf -p` en affiche le contenu.

## Flag
```
f2av5il02puano7naaf6adaf3a
```
