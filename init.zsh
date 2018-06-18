p6df::modules::shell::version() { echo "0.0.1" }
p6df::modules::shell::deps()    {
        ModuleDeps=(p6m7g8/p6issi)
}

p6df::modules::shell::external::brew() {

  brew install irssi
}

p6df::modules::shell::irssi::home::symlink() {
 
  # XXX: ~/.irssi
}

p6df::modules::shell::init() {

  p6df::modules::shell::aliases::init
}

p6df::modules::shell::aliases::init() {

  alias irc='p6df::modules::shell::irc'
  alias irc_attach='p6df::modules::shell::irc::attach'
  alias irc_init='p6df::modules::shell::irc::init'
}

p6df::modules::shell::irc::attach() {

  tmux attach -t irc
}

p6df::modules::shell::irc::init() {

  tmux new -s irc irssi
}

p6df::modules::shell::irc() {

  if ! irc_attach ; then
    irc_init
  fi
}

