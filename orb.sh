#!/usr/bin/env bash

colour=$@
echo Parsing \"$colour\"
if [[ $colour =~ ^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ ]];
then 
	echo \"$colour\" is a Web Colour
else
	echo \"$colour\" is NOT a Web Colour
	regarg="^"$(printf %q "$colour")"$"
	echo Trying to parse it as a colour name using regexp \"$regarg\"
	colour=`curl -s 'https://raw.githubusercontent.com/jonathantneal/color-names/master/color-names.json' | jq -r --arg colour "$regarg" '. | with_entries(select(.value|match($colour;"i"))) | keys[] '`
fi
if [ -z "$colour" ]
then
	echo Unable to parse \"$1\" as a colour
else
	echo Setting your gloworb to "$colour"
	curl -o - \
		-d $colour \
		-u 'use-token-auth:YOUR_AUTH_TOKEN_HERE' \
		-H 'Content-Type: text/plain' \
		-X POST \
		https://your.cloud.url.here:8883/your/uri/here/with/serial/events/cmd
fi

### If the above stops working, there is a smaller alternative (only 256 colours) here:
### colour=`curl -s 'https://jonasjacek.github.io/colors/data.json' | jq -r --arg colour $regarg '.[] | select(.name | match($colour;"i")) | .hexString'`
