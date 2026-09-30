# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/svetzal/.docker/bin"
# End of Docker Desktop section.

export NVM_DIR="$HOME/.nvm"
export PATH="$PATH:/Users/svetzal/.dotnet/tools:/Users/svetzal/bin"

# The one foundryd runs on mojility-ops-01 (LAN bind, 2026-09-29). Lives here,
# not in zshrc, because agent shells are login shells that never read zshrc.
export FOUNDRY_DAEMON_ADDR="http://mojility-ops-01.local:50051"
