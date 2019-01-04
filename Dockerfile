from alpine
MAINTAINER David Anderson "david@misplaced.us"

# Super simple curl-bot.
# UPDATE_URL is the URL that dynamically sets your new IP - Get from here: http://freedns.afraid.org/dynamic/
# UPDATE_INTERVAL is the frequency at which to check/update 1800 is probably reasonable

# EXAMPLE RUN COMMAND:
# docker run -dit --restart always -e UPDATE_URL="http://freedns.afraid.org/dynamic/update.php?< AFRAID API KEY >" -e UPDATE_INTERVAL="300" dynamic-updater

ENTRYPOINT while echo -n "$(date) " && wget -q -O - "$UPDATE_URL"; do sleep "$UPDATE_INTERVAL"; done; echo "Exiting." exit 1
