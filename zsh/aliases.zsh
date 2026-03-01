alias reload!='. ~/.zshrc'

if [[ $IS_MAC ]]; then
	alias grammarly="open -a Grammarly"
fi

if [[ $IS_LAPTOP ]]; then
	alias ethup="sudo service dhcpd restart ue0"
	alias wifidown="sudo serivce netif stop wlan0"
	alias wifiup="sudo serivce netif start wlan0"
fi
