# Scripts for Cardano Stake Pool Operatos

Here you will find some simple yet useful scripts to operate your Cardano Staking Pool

## telegram-send-leaderlog.sh
**Package needed**: **jq** (sudo apt install jq)

A simple bash script to parse leaderlog.json (created by **cncli** - https://github.com/AndrewWestberg/cncli) and send a notification via Telegram bot

You need to customize and replace:

* **LEADERLOG.JSON**: replace it with the path to your leaderlog.json, you can use curl or cat it and pipe to jq
* **APIKEY**: API key of your telegram bot
* **CHAT_ID**: Chat ID of your telegram public/private group

You can put it in your crontab and schedule it

## ada-airdrop.sh
**Package needed**: **default-mysql-client** (sudo apt install default-mysql-client)

Bash script used to update stake quantity and drop participation based on staked amount. MySQL/MariaDB db used.
URL: https://ada-airdrop.hwlegnano.it/

You need to customize and replace:

* **XXXXXX**: replace it with your relevant data

You can put it in your crontab and schedule it

## ftp-leaderlog-put.sh
**Package needed**: **ftp** (sudo apt install ftp)

Bash script used to upload calculated leaderlog (by cncli-leaderlog-snapshot.sh) to a remote hosting provider.
URL: https://www.hwlegnano.it/cardano/

You need to fill in these variables:

* **HOST**: fill in your HOSTNAME
* **USER**: fill in your USER
* **PASSWORD**: fill in your PASSWORD 

You can put it in your crontab and schedule it after cncli-leaderlog-snapshot.sh

## cncli-leaderlog-snapshot.sh
**Package needed**: **cncli** (https://github.com/AndrewWestberg/cncli)
URL: https://www.hwlegnano.it/cardano/

This script calls cncli to calculate leaderlog.
This script must:

* be run 18 hours or earlier prior to epoch end
* have cncli.db available --- /usr/local/bin/cncli sync --host 127.0.0.1 --port 6000 --db /home/USER/cardano-node/scripts/cncli.db --- strongly recommended to run this as systemd service

You need to customize and replace:

* **USER**: replace with your $home user
* **POOL_ID**: replace with your pool id (you can find it in adapools.org)

You can put it in your crontab and schedule it after cncli-leaderlog-snapshot.sh

## leaderlog_minted.php

Simple php code to fetch leaderlog.json and print slots/blocks minted, missed and coming so far.
URL: https://www.hwlegnano.it/cardano/

You need to fill in these variables:

\_URL: fill in your URL to fetch leaderlog.json from
\_POOL: fill in your pool ID, you can easily find it in adapools.org
1_TOKEN: if you use Basic Auth to protect leaderlog.json, fill in your auth token
2_TOKEN: register on blockfrost.io and fill in your project id

### Contacts

* Telegram: https://t.me/ItalyADAPool
* Website: https://www.hwlegnano.it/contatta
