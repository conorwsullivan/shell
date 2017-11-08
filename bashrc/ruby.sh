
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [ -x $HOME/.rvm/scripts/rvm ]
then
  source $HOME/.rvm/scripts/rvm # Setup RVM bash function
fi

alias bundle='JRUBY_OPTS=--1.9 `which bundle`'

export JRUBY_DEV_OPTS="--1.9 -X-C -J-client -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -Xcompile.invokedynamic=false"
export JRUBY_OPTS=$JRUBY_DEV_OPTS

