# Conky

https://i3wm.org/docs/user-contributed/conky-i3bar.html
https://epsi-rns.github.io/desktop/2016/08/01/modularized-i3status-conky-lua-json.html

# Suspend

On Ubuntu 16.04 LTS, I successfully used the following to disable suspend:

    sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

And this to re-enable it:

    sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
