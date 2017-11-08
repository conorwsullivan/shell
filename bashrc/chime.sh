chime()
{
  if [[ $HOUR -eq 12 ]]; then
    HOUR_STRING="noon"
  elif [[ $HOUR -gt 12 ]]; then
    HOUR12=$((HOUR-12))
    HOUR_STRING=$HOUR12" O'clock"
  else
    HOUR12=$((HOUR))
    HOUR_STRING=$HOUR12" O'clock"
  fi

  echo -e "\n\e[7;49;39m"
  echo -e "                             "
  echo -e "            =^-^=            "
  printf '    Meow! Its %10s!    \n' "$HOUR_STRING"
  echo -e "                             "
  echo -en "\e[0m"
}

LAST_HOUR=$(date +"%-H")
maybe_chime()
{
  HOUR=$(date +"%-H")
  if [[ $HOUR != $LAST_HOUR ]]; then
    LAST_HOUR=$HOUR

    chime
  fi
}

