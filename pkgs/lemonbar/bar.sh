#!/usr/bin/bash

Clock() {
	TIME=$(date "+%H:%M:%S")
	echo -e -n " \uf017 ${TIME}"
}

Cal() {
	DATE=$(date "+%a, %m %B %Y")
	echo -e -n "\uf073 ${DATE}"
}

ActiveWindow() {
	len=$(echo -n "$(xdotool getwindowfocus getwindowname)" | wc -m)
	max_len=70
	if [ "$len" -gt "$max_len" ]; then
		echo -n "$(xdotool getwindowfocus getwindowname | cut -c 1-$max_len)..."
	else
		echo -n "$(xdotool getwindowfocus getwindowname)"
	fi
}

Sound() {
	volume="$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }' | cut -d '%' -f 1)"
	printf "$volume%% "
}

while true; do
	echo -e "%{c}$(ActiveWindow)" "%{r}$(Sound) $(Clock) $(Cal)"
	sleep 0.1s
done
