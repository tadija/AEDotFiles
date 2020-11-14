# https://github.com/tadija/AEDotFiles
# init.sh

source $df/custom/config.sh
source $df/system/commands.sh

for plugin in $dfplugins; do
	local file=$(df-find $plugin)
	source $file
done
