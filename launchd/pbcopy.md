# remote pbcopy
*   Copy pbcopy.plist into ~/Library/LaunchAgents
*   Launch with 
        launchctl load ~/Library/LaunchAgents/pbcopy.plist
*   Add automatic forwarding of remote port 2224 to localhost port 2224. 
    Insert the below to ~/.ssh/config
        RemoteForward 127.0.0.1:2224 127.0.0.1:2224

