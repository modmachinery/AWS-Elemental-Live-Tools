#!/bin/env bash
WDIR=/etc/httpd/conf.d

echo "Backing up latest default Apache config..."
sudo cp -v $WDIR/elemental_se_apache.conf $WDIR/elemental_se_apache.conf.bak.1

## Exit script if no custom SSL Apache config is found
if [[ ! -f $WDIR/elemental_se_apache.conf.ssl ]]; then
	echo; echo "*** WARNING: Custom SSL Apache config was found."
	echo "    Please upload a backup copy, or create a new one."
	exit 1
fi

echo "Restoring custom SSL Apache config..."
sudo cp $WDIR/elemental_se_apache.conf.ssl $WDIR/elemental_se_apache.conf

echo "Performing Apache config test..."
if ! sudo service httpd configtest 2> >(grep -q "Syntax OK"); then
	echo; echo "*** WARNING: Apache config test has FAILED."
	echo "    Please see the output below for reference:"; echo
	sudo service httpd configtest
	echo; echo "Exiting without restarting Apache; SSL config was NOT restored."
	exit 1
fi

echo "Apache config test passed; restarting Apache..."
sudo service httpd restart

echo; echo "Done."
