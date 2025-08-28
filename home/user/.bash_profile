echo "wokonuje się bash profile"

while true; do
    if [[ "$(tty)" == "/dev/tty3" ]] \
       && [[ -z "${DISPLAY:-}" ]] \
       && [[ -s /tmp/gamescopecommand ]]; then
        cmd=$(cat /tmp/gamescopecommand)
        rm /tmp/gamescopecommand
        echo "Autostart: $cmd"
        /usr/local/bin/gamescopehdr $cmd
    fi
    sleep 1
done
