if [[ $(hostname) = 'allendale.engr.mun.ca' || $(hostname) = 'allandale.engr.mun.ca' ]]; then
    IS_ALLENDALE=1
fi

if [[ $(hostname) = 'river' ]]; then
	IS_LAPTOP=1
fi
