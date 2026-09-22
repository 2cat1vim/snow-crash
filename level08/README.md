# Level 08 → Level 09

**Mot de passe du niveau :** flag de `level07`

## Cible
Service `blacksun` écoutant sur la socket UNIX `/run/blacksun/blacksun.sock`.

## Vulnérabilité
Le protocole binaire du service utilise un en-tête (`msg_header_t`) contenant un
champ `state` que le **client** fournit lui-même. La machine à états côté serveur
fait confiance à ce champ au lieu de suivre la progression réelle de la
connexion (`INIT → AUTH → ADMIN`). On peut donc annoncer directement
`STATE_ADMIN` et envoyer la commande `CMD_ADMIN` sans jamais s'authentifier —
un contournement de machine à états.

## Exploitation
Un client C (`/tmp/pkt.c`) reconstruit le protocole :
1. `HELLO` avec le magic `0xDEAD` en `STATE_INIT` ;
2. directement `CMD_ADMIN` en prétendant être en `STATE_ADMIN`.

Le serveur renvoie alors le flag. Compilation et lancement automatisés dans
`ressource/exploit.sh`.

## Flag
```
s5cAhoAfNT9GrgqykhZavyBg9
```
