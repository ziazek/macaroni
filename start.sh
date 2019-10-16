# export PUBLIC_HOSTNAME=`curl http://169.254.170.2/v2/metadata --max-time 5 | jq -r ".Containers[0].Networks[0].IPv4Addresses[0]"`
export PUBLIC_HOSTNAME=`curl -s http://169.254.169.254/latest/meta-data/public-hostname --max-time 3`

echo "Hostname: $PUBLIC_HOSTNAME"

# REPLACE_OS_VARS=true /app/release/bin/start_server foreground
REPLACE_OS_VARS=true /home/app/prod/rel/macaroni/bin/macaroni start
