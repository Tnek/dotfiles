#: Seperator to divide each value on the statusbar.
sep="|"

#: Gmail Mail Widget
#: Set the directory for your login information for your email below:
login_dir=$HOME/.backup/login
#: At $login_dir, your information should be in the below format:
#:     username="your_username"
#:     password="your_password"
getEmail()
{
    if host mail.google.com &> /dev/null; then
        . $login_dir
        curl -s https://"$username":"$password"@mail.google.com/mail/feed/atom &> ${HOME}/.mailcache
        fullcount=$(awk -F '</?fullcount>' 'NF>1{print $2}' $HOME/.mailcache)
        if [[ "$fullcount" == '0' ]]; then
            echo -ne ""
        else
            echo -ne "$sep Emails: $fullcount "
        fi
    fi
}

#: MPD Now Playing Widget
#: If no song is playing, it will not appear. As such, this should be accounted
#: for when setting your statusbar.
getMpd()
{
    if [ "`mpc | sed '2q;d' | grep playing | wc -l`" != 1 ]; then
        echo -ne ""
    else
        mpctime="`mpc | sed '2q;d' | grep playing | awk '{ print $3 }'`"
        echo -ne "$sep `mpc | head -1 | cut -c 1-200` [$mpctime] "
    fi
}

#: Date Widget
#: Formatted as:
#:     $DAY, $MONTH $DATE $TIME
getDate()
{
    echo -ne $(date +"%a %b %d %r")
}

#: DWM's statusbar is printed as the value of `xsetroot -name`
#: This is somewhat a hackish way of making a statusbar.
while true; do
    xsetroot -name  "$(getEmail)$(getMpd)$sep $(getDate) $sep" 
    sleep 1s
done &
