
######################################################################
#<
#
# Function: p6df::modules::irc::deps()
#
#>
######################################################################
p6df::modules::irc::deps() {
  ModuleDeps=(
    p6m7g8/p6df-shell
  )
}

######################################################################
#<
#
# Function: p6df::modules::irc::external::brew()
#
#>
######################################################################
p6df::modules::irc::external::brew() {

  brew install irssi
}

######################################################################
#<
#
# Function: p6df::modules::irc::home::symlink()
#
#>
######################################################################
p6df::modules::irc::home::symlink() {

  ln -fs $P6_DFZ_SRC_P6M7G8_DIR/p6df-irc/share/irssi .irssi
}

######################################################################
#<
#
# Function: p6df::modules::irc::init()
#
#>
######################################################################
p6df::modules::irc::init() {

  p6df::modules::irc::aliases::init
}

######################################################################
#<
#
# Function: p6df::modules::irc::aliases::init()
#
#>
######################################################################
p6df::modules::irc::aliases::init() {

  alias irc='p6df::modules::irc'
  alias irc_attach='p6df::modules::irc::attach'
  alias irc_init='p6df::modules::irc::init'
}

######################################################################
#<
#
# Function: p6df::modules::irc::attach()
#
#>
######################################################################
p6df::modules::irc::attach() {

  tmux attach -t irc
}

######################################################################
#<
#
# Function: p6df::modules::irc::start()
#
#>
######################################################################
p6df::modules::irc::start() {

  tmux new -s irc irssi
}

######################################################################
#<
#
# Function: p6df::modules::irc()
#
#>
######################################################################
p6df::modules::irc() {

  if ! p6df::modules::irc::attach; then
    p6df::modules::irc::start
  fi
}
