#!/bin/sh

# Checking if external data config is present, and integrate
if [ -f /data/cache.db ]
then
	rm -f /opt/SickRage/cache.db
	ln -s /data/cache.db /opt/SickRage/cache.db
fi

if [ -f /data/config.ini ]
then
	rm -f /opt/SickRage/config.ini
	ln -s /data/config.ini /opt/SickRage/config.ini
fi

if [ -f /data/failed.db ]
then	
	rm -f /opt/SickRage/failed.db
	ln -s /data/failed.db /opt/SickRage/failed.db
fi

if [ -f /data/sickbeard.db ]
then	
	rm -f /opt/SickRage/sickbeard.db
	ln -s /data/sickbeard.db /opt/SickRage/sickbeard.db
fi

if [ -d /data/cache ]
then
	rm -rf /opt/SickRage/cache
	ln -s /data/cache /opt/SickRage/cache
fi	

if [ -d /data/Logs ]
then
	rm -rf /opt/SickRage/Logs
	ln -s /data/Logs /opt/SickRage/Logs
fi	

# If no config is present, we create it
if [ ! -f /data/sickbeard.db ] && [ ! -f /data/config.ini ]
then
	touch /data/cache.db
	ln -s /data/cache.db /opt/SickRage/cache.db

	touch /data/config.ini
	ln -s /data/config.ini /opt/SickRage/config.ini

	touch /data/failed.db
	ln -s /data/failed.db /opt/SickRage/failed.db

	touch /data/sickbeard.db
	ln -s /data/sickbeard.db /opt/SickRage/sickbeard.db

	mkdir /data/cache
	ln -s /data/cache /opt/SickRage/cache

	mkdir /data/Logs
	ln -s /data/Logs /opt/SickRage/Logs
fi


# Updating SickRage
cd /opt/SickRage
git pull

# Running SickRage
python SickBeard.py