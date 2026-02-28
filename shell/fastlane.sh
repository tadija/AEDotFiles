# http://fastlane.tools
# fastlane.sh

function setup-fastlane() {
  gem install fastlane -NV
}

if [ -x "$(command -v fastlane)" ]; then
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
fi
