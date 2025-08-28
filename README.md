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
