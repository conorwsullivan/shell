On Ubuntu 16.04 LTS, I successfully used the following to disable suspend:

    sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

And this to re-enable it:

    sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
