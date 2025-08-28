Edit which user will autologin to tty3 session (also remember to put /home/user/.bash_profile into that user's home directory):
```
sudo systemctl edit getty@tty3.service
```

Restart tty3 session:
```
sudo systemctl restart getty@tty3.service
```

Run game from steam in separate tty session (steam launch parameters):
```
gamescope-session %command%
```

How it works?
By adding gamescope-session to launch parameters, steam first executes /usr/local/bin/gamescope-session and passes game launch arguments to that file.

gamescope-session then passes it directly go gamescope-session-sid, which takes appid from the given command and saves it with new launch command to /tmp/gamescopecommand and changes current tty session to tty3. 

An user is automatically logged into tty3 and executes .bash_profile, which infinitely checks for the existance of /tmp/gamescopecommand. If the file appears, it reads the command from that fiile and executes gamescopehdr with the given command, then it removes it to prevent a loop.

gamescopehdr is a gamescope wrapper, that sets correct parameters, before running it, it kills steam in case it is running in a different session. It then launches steam with app id.

gamescope takes over drm device in tty3 and launches new session with steam inside. Steam then automatically launches the same game again, whith the same command (gamescope-session %command%), but this time gamescope-session is already running in tty3, so it just executes the command directly.
