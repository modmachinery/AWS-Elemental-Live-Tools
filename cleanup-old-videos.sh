#!/usr/bin/env bash

## Suggested cron entry:
#@weekly		elemental	/usr/local/bin/cleanup-old-videos.sh > /dev/null 2>&1

## Finds file older than 90 days and deletes them
find /data/server/incoming/ -mtime +90 -type f -delete
