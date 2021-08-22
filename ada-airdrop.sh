#!/usr/bin/env bash

DELEGATORS=$(curl -s https://cardano-mainnet.blockfrost.io/api/v0/pools/de2e00a923f6dd016a43087e608df9b6ddd4e587e8ff4f39c64e2d43/delegators -H 'project_id: XXXXXX')
drop1=150000000
drop2=900000000

for row in $(echo "${DELEGATORS}" | jq -r '.[] | @base64'); do

    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }

mysql -u XXXXXX -D XXXXXX -h XXXXXX -N -e "UPDATE XXXXXX SET adaStaked = $(echo $(_jq '.live_stake')) WHERE stakeAddress = '$(echo $(_jq '.address'))';"

db_stake=$(mysql -u XXXXXX -D XXXXXX -h XXXXXX -N -e "select adaStaked from hwlairdrop where stakeAddress='$(echo $(_jq '.address'))';")

if (( db_stake >= drop1 ))
then

mysql -u XXXXXX -D XXXXXX -h XXXXXX -N -e "UPDATE hwlairdrop SET drop1 = 1 WHERE stakeAddress = '$(echo $(_jq '.address'))';"

fi

if (( db_stake >= drop2 ))
then

mysql -u XXXXXX -D XXXXXX -h XXXXXX -N -e "UPDATE hwlairdrop SET drop2 = 1 WHERE stakeAddress = '$(echo $(_jq '.address'))';"

fi

done
