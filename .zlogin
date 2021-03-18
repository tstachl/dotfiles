#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# Execute code in the background to not affect the current session
(
  zinit self-update >/dev/null 2>&1
  zinit update >/dev/null 2>&1
) &!
