# Level 09 → Level 10

**Mot de passe du niveau :** flag de `level08`

## Cible
`/opt/snowcrash/level09/da5id`

## Vulnérabilité
Le binaire attend un « token » d'autorisation en argument, mais ce token est
codé en dur dans le binaire et récupérable via `strings`. Fourni au binaire, il
débloque l'affichage du flag.

## Exploitation
```bash
TOKEN=$(strings /opt/snowcrash/level09/da5id | grep -oE 'Iheartpwnage' | head -1)
/opt/snowcrash/level09/da5id "$TOKEN"
```
Voir `ressource/exploit.sh`.

## Flag
```
s19q3m3u4toaequegh8ahpicel
```
