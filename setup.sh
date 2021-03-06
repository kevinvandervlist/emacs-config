#!/bin/bash
if [ $# -ne 1 ]; then
	echo "Copy the emacs config to a certain directory."
	echo "The old emacs config is backed up."
	echo "Usage: `basename $0` /home/kevin"
	exit 1
fi

DEST=$1
CWD=$(pwd)
TMPDIR=$(mktemp -d)

mkdir -p ${DEST}

if [ -f "${DEST}/.emacs" ]; then
	mv ${DEST}/.emacs ${TMPDIR}/.
fi

if [ -d "${DEST}/.emacs.d" ]; then
	mv ${DEST}/.emacs.d ${TMPDIR}/.
fi

ln -s ${CWD}/dot-emacs.d ${DEST}/.emacs.d
ln -s ${CWD}/dot-emacs ${DEST}/.emacs

echo "Copied files to ${DEST}/."
echo "Backup is in ${TMPDIR}"
exit 0
