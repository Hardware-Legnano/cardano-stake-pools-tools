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

### Contacts

* Telegram: https://t.me/ItalyADAPool
* Website: https://www.hwlegnano.it/contatta
