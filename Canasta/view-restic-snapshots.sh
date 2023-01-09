#!/bin/bash
cd ~/mediawiki-cli/manage-snapshots-canasta/
export CANASTA_ROOT=~/mwstakeorgdevclone
./view-restic-snapshots.sh

echo "cd ~/mediawiki-cli/manage-snapshots-canasta/ && export CANASTA_ROOT=~/mwstakeorgdevclone && ./restore-restic-snapshot.sh b8163e61 --skip-before-restore-snapshot"
echo 'AFTER RESTORE ADJUST $wgServer IN LocalSettings.php'