######################################################################
#<
#
# Function: p6df::modules::shell::irc::version()
#
#>
######################################################################
p6df::modules::shell::irc::version() { echo "0.0.1" }

######################################################################
#<
#
# Function: p6df::modules::shell::irc::external::brew()
#
#>
######################################################################
p6df::modules::shell::irc::external::brew() {

  brew install irssi
}

######################################################################
#<
#
# Function: p6df::modules::shell::irc::home::symlink()
#
#>
######################################################################
p6df::modules::shell::irc::home::symlink() {

  ln -fs $P6_DFZ_SRC_P6M7G8_DIR/p6df-irc/share/irssi .irssi
}

######################################################################
#<
#
# Function: p6df::modules::shell::irc::init()
#
#>
######################################################################
p6df::modules::shell::irc::init() {

  p6df::modules::shell::irc::aliases::init
}

######################################################################
#<
#
# Function: p6df::modules::shell::irc::aliases::init()
#
#>
######################################################################
p6df::modules::shell::irc::aliases::init() {

  alias irc='p6df::modules::shell::irc'
  alias irc_attach='p6df::modules::shell::irc::attach'
  alias irc_init='p6df::modules::shell::irc::init'
}

######################################################################
#<
#
# Function: p6df::modules::shell::irc::attach()
#
#>
######################################################################
p6df::modules::shell::irc::attach() {

  tmux attach -t irc
}

######################################################################
#<
#
# Function: p6df::modules::shell::irc::init()
#
#>
######################################################################
p6df::modules::shell::irc::init() {

  tmux new -s irc irssi
}

######################################################################
#<
#
# Function: p6df::modules::shell::irc()
#
#>
######################################################################
p6df::modules::shell::irc() {

  if ! irc_attach ; then
    irc_init
  fi
}