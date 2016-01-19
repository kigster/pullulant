# Pullulant Development Environment on Mac OS-X

This document describes a set of quick steps to run a fully automated setup of the development
environment needed to build ruby applications on Mac OS-X.

## Pre-Install – OS-X Preparation

  1. Run `xcode-select --install` to make sure you have dev tools
  2. Run OS-X Updates if any, and reboot if requested.
  3. Go to _System Preferences / Security & Privacy / General_, unlock the panel and choose the radio button "Allow apps downloaded from <Anywhere>". This is required for running `phantomjs` binary that's downloaded later.
  4. Go to _System Preferences / Sharing _, unlock the panel and set the hostname of your system, if it's currently set to a default.

### About your OS-X user

Note: shared resources used by the Homebrew, such as files under `/usr/local`, will change ownership
to the user running this installer. Even though an effort was made to ensure that group `staff`
can access shared files there, if you have another development user on this machine, there may
be some issues with permissions.

The current OS-X user must be configured as "Admin" on the Mac, and upon entering their password after the first
request for `sudo`, the user will be modified to allow password-less `sudo` access. If this is not
what you want, remove the file `/private/etc/sudoers.d/${USER}`


## Install

  1. If you don't already have SSH keys setup on this machine, now is the time: `ssh-keygen -t rsa -b 4096 -C "${USER}@${HOSTNAME}"; cat ~/.ssh/id_rsa.pub | pbcopy` 
  2. Add the new SSH key to the Github settings page: https://github.com/settings/ssh
  3. Run the following installer:

```bash
curl -fsSL 'http://sw.im/pullulant.sh' | /usr/bin/env bash
```

Alternatively:

```bash
export ws="~/workspace"     # your workspace directory
[[ -d ${ws} ]] || mkdir -p ${ws}
[[ -d "${ws}/pullulant" ]] || cd ${ws} && git clone "git@github.com:kigster/pullulant.git"
cd pullulant && git pull && ./pullulant -a
```

## After a Successful Install

 * Reboot (required after the first successful install!)
 * Open System Preferences, Security & Privacy, choose Privacy tab and unlock the lock at the bottom. After that choose Accessibility and then check "ShiftIt" application.

## Author

&copy; 2015-2016 Konstantin Gredeskoul, portions of this code were donated by [Shippo, Inc.](http://goshippo.com) and used with permisssion.
