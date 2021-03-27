
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

  echo ln -fs $P6_DFZ_SRC_P6M7G8_DIR/p6df-irc/share/irssi .irssi
#  ln -fs $P6_DFZ_SRC_P6M7G8_DIR/p6df-irc/share/irssi .irssi
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

  alias p6_irc='p6df::modules::irc'
  alias p6_irc_attach='p6df::modules::irc::attach'
  alias p6_irc_init='p6df::modules::irc::init'
}

######################################################################
#<
#
# Function: p6df::modules::irc::attach()
#
#>
######################################################################
p6df::modules::irc::attach() {

  p6df::modules::shell::tmux::attach "irc"
}

######################################################################
#<
#
# Function: p6df::modules::irc::start()
#
#>
######################################################################
p6df::modules::irc::start() {

  
  p6df::modules::shell::tmux::new "irc" "irssi"
}

######################################################################
#<
#
# Function: p6df::modules::irc()
#
#>
######################################################################
p6df::modules::irc() {

  p6df::modules::shell::tmux::make "irc" "irssi"
}
