# https://aka.ms/dotnet/info
# dotnet.sh

if [[ -d "$HOME/.dotnet" ]]; then
  export PATH=$PATH:$HOME/.dotnet/tools
  export DOTNET_CLI_HOME="$HOME/.dotnet"
fi

