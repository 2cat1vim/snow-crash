# Snow Crash

Solutions du wargame **Snow Crash** (école 42) — élévation de privilèges de
`level00` à `level10`, chaque flag servant de mot de passe au niveau suivant.

## Organisation

Chaque dossier `levelXX/` contient :

| Fichier                  | Rôle                                                        |
|--------------------------|-------------------------------------------------------------|
| `README.md`              | Explication de la vulnérabilité et de l'exploitation        |
| `flag`                   | Flag récupéré (= mot de passe du niveau suivant)            |
| `ressource/run.sh`       | Connexion SSH au niveau et lancement de l'exploit           |
| `ressource/exploit.sh`   | Exploit joué automatiquement une fois connecté              |
| `ressource/howto.txt`    | Notes de résolution (quand présent)                         |

## Utilisation

```bash
cd levelXX/ressource
./run.sh [host [port]]   # défaut : 127.0.0.1 4242
```
`run.sh` récupère le flag du niveau précédent comme mot de passe (via `sshpass`),
se connecte en SSH puis exécute `exploit.sh` à distance.

## Récapitulatif des techniques

| Niveau | Technique                                                          |
|--------|-------------------------------------------------------------------|
| 00     | Flag dans une section ELF (`.flag_data`) — `readelf -p`           |
| 01     | Démon exposant le flag dans `ps aux`                              |
| 02     | Flag en clair dans les `strings` du binaire                      |
| 03     | Timer systemd + `include()` CMake injecté (`burbclave`)          |
| 04     | Timer systemd + macro `syscmd()` de m4 (`babel`)                 |
| 05     | Module WASM/WASI remplacé, exécuté par le service `metaverse`    |
| 06     | Symlink + archivage gzip du binaire `raven`                      |
| 07     | Évasion de sandbox Python (introspection → `os.system`)          |
| 08     | Contournement de machine à états sur socket UNIX (`blacksun`)    |
| 09     | Token d'autorisation en dur récupéré via `strings`              |
| 10     | Injection de commande via sortie WASM réinjectée dans un shell   |
