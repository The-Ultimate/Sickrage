#!/bin/sh
PYTHON=/usr/bin/python
SICKRAGE=/sickrage
DATA=/Configs/sickrage

if [ -d $DATA ] && [ -r $DATA/sickrage_config.ini ];
then
	cd $SICKRAGE
	$PYTHON $SICKRAGE/SickBeard.py --config=$DATA/sickrage_config.ini --data=$DATA
else
	mkdir -p $DATA
	mv $SICKRAGE/sickrage_config.ini $DATA
	cd $SICKRAGE
	ln -s $DATA/sickbeard.db
	$PYTHON $SICKRAGE/SickBeard.py --config=$DATA/sickrage_config.ini --data=$DATA
fi
