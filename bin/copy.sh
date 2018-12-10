if [[ $OSTYPE == darwin* ]]; then
  pbcopy
elif [[ $OSTYPE == cygwin* ]]; then
  cat > /dev/clipboard
else
  if (( $+commands[xclip] )); then
    xclip -in -selection clipboard
  elif (( $+commands[xsel] )); then
    xsel --clipboard --input 
  else
    print "clipcopy: Platform $OSTYPE not supported or xclip/xsel not installed" >&2
    return 1
  fi
fi
