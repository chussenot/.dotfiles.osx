# Another quick function to shorten something like this:
# ps aux | grep PROCESS_NAME. (Usage: psa NAME)
psa () {
  ps aux | grep $1
}

myuptime () {
  uptime | awk '{ print "Uptime:", $3, $4, $5 }' | sed 's/,//g'
  return;
}

top-commands () {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' \
  | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n15
}
