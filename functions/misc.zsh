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

vplay () {
  go-peerflix --player vlc `cat $1`
}

# Start an HTTP server from a directory, optionally specifying the port
function httpserver() {
  local port="${1:-8000}";
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Expose it to the internet
function httpserver-ngrok() {
  local port="${1:-8000}";
  ngrok http ${port}
}
