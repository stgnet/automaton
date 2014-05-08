#!/bin/bash
# install components needed to operate automaton scripts
set -eu

[ ! -d cron ] && echo ERROR: missing cron directory && exit 1

CRONS=($(ls -1 cron))
for CRON in ${CRONS[*]}
do
	if [ ! -L /etc/cron.$CRON/automaton ]
	then
		sudo ln -s $PWD/cron/$CRON /etc/cron.$CRON/automaton
	fi
done

