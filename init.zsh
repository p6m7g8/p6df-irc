p6df::modules::shell::irc::version() { echo "0.0.1" }
p6df::modules::shell::irc::deps()    {
        ModuleDeps=()
}

p6df::modules::shell::irc::external::brew() {

  brew install irssi
}

p6df::modules::shell::irc::home::symlink() {
 
  # XXX: ~/.irssi
  true;
}

p6df::modules::shell::irc::init() {

  p6df::modules::shell::irc::aliases::init
}

p6df::modules::shell::irc::aliases::init() {

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
