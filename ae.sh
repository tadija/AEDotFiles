#!/usr/bin/env bash

#
# AEDotFiles
#
# Copyright (c) 2015 Marko Tadić <tadija@me.com> http://tadija.net
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

echo -e "\n# Hello $USER!\n"

# backup .bash_profile if it already exists
if [ -f ~/.bash_profile ]; then
mv ~/.bash_profile ~/.bash_profile.backup
echo -e "# Your current .bash_profile is copied to .bash_profile.backup"
fi

# configure and load new .bash_profile
cp ~/.dotfiles/profile/template.sh ~/.bash_profile
source ~/.bash_profile

# print stuff
echo -e "# This is how you new .bash_profile looks: \n"
cat ~/.bash_profile

echo -e "\n# You can now begin with the setup by running these commands:\n"
echo "setup-terminal"
echo "setup-homebrew"
echo "setup-binaries"
echo "setup-apps"
echo "setup-system"
echo "setup-custom"

echo -e "\n# https://github.com/tadija/AEDotFiles\n"
