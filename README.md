# Pullulant Development Environment on Mac OS-X

This document describes a set of quick steps to run a fully automated setup of the development
environment needed to build ruby applications on Mac OS-X.

## Pre-Install – OS-X Preparation

  1. Run `xcode-select --install` to make sure you have dev tools
  2. Run OS-X Updates if any, and reboot if requested.
  3. Go to _System Preferences / Security & Privacy / General_, unlock the panel and choose the radio button "Allow apps downloaded from <Anywhere>". This is required for running `phantomjs` binary that's downloaded later.
  4. Go to _System Preferences / Sharing_, unlock the panel and set the hostname of your system, if it's currently set to a default.

### About your OS-X user

Note: shared resources used by the Homebrew, such as files under `/usr/local`, will change ownership
to the user running this installer, with full `xwr` permissions. This is so that the effects of any previously run `sudo brew` nuisance is neutralized.

Typically your group will be `staff`.  Whatever group you are, that group is applied to the key const_owned_folder_list (`/usr/local` and `/var/chef`), with permissions also reset to `xwr`. The idea is that this move should permit multiple co-existing users to share `/usr/local` and `/var/chef` at the same time.  

Note that the current OS-X user must be configured as "Admin" on the Mac, and upon entering their password after the first request for `sudo`, the user will be modified to allow password-less `sudo` access for the duration of the script.

At the very end, installer cleans this up, or you can run `pullulant -r reset-sudo`


## Install

  1. If you don't already have SSH keys setup on this machine, now is the time: `ssh-keygen -t rsa -b 4096 -C "${USER}@${HOSTNAME}"; cat ~/.ssh/id_rsa.pub | pbcopy`
  2. Add the new SSH key to the Github settings page: https://github.com/settings/ssh
  3. Run the following installer:

```bash
curl -fsSL 'http://sw.i./pu.sh' | /usr/bin/env bash
```

Alternatively:

```bash
export ws="${HOME}/workspace"     # your workspace directory
[[ -d ${ws} ]] || mkdir -p ${ws}
[[ -d "${ws./pu" ]] || cd ${ws} && git clone "git@github.com:kigste./pu.git"
cd pullulant; git pull --rebase; ./pu -a
```

## After a Successful Install

 * Reboot (required after the first successful install!)
 * Open System Preferences, Security & Privacy, choose Privacy tab and unlock the lock at the bottom. After that choose Accessibility and then check "ShiftIt" application.

## Driving the Script


```bash
_____________________________________________________________________________________
|                                                                                   |
|  Pullulant                                                                        |
|  Development Environment Installer v0.0.1.                                        |
|  Git rev 0e85cdb.                                                                 |
|___________________________________________________________________________________|

Installers:
   permissions homebrew nodejs hostnames rubyinstall sproutwrap
   monofonts zsh preferences home

Helpers:
   brew-update brew-upgrade brew-wipe reinstall-postgres sudo-disable
   sudo-enable

Actual Run List:


Usage: ./pu -a [-S] [-B] [-n|-q|-v]
       ./pu -r 'runner1 runner2 ...' [-S] [-B] [-n|-q|-v]
       ./pu -r homebrew [-L] [-R] [-n|-q|-v]
   Or: ./pu [-l] [-h|-H]


Where, runner is either an installer or a helper.

  -a          run [a]ll installers in order
  -r runner   run only a specified [r]unner (either helper or installer)
  -S          [S]proutwrap is disabled during the install
  -B          [B]rew-upgrade is disabled

  -L          [L]ink or relink each brew of formulas with --force
  -R          [R]einstall each brew formula with --force

  -q          [q]uiet mode: stop printing commands before and after run.
  -v          [v]erbose run show command's output, and add -v to some
  -n          dry-ru[n] print commands, but don't actually run them.

  -l          [l]ists available runners  helpers and installers
  -h          this [h]elp message
  -H          this help message, and explanation of helpers and installers

Examples:
    ./pu -a                          # install everything
    ./pu -r reinstall-postgres       # run just reinstall-postgres
    ./pu -rf 'brew-wipe homebrew'    # wipe and reinstall homebrew
    ./pu -aSB                        # install everything, minus
                                              homebrew and sprout-wrap

  Runner:
      Most common usage is with the -a  flag, that runs all installers.
      Installers are bash modules located in the ./installers folder. Each
      installer has a bash function that matches the name of the file.

      The -r flag can be supplied more than once, or once but with multiple
      arguments in quotes, eg -r 'runner1 runner2' or -r runner1
      -r runner2. Presence of this flag indicates that only specified
      runnings will run.

  Helpers
      Helpers are similar to installers, but they are not ordered, and are
      not included in the default install. They are meant to be used ad-hoc.

      Eg, to wipe out existing PostgreSQL and re-run the installer
      do this below. This may be necessary when installing on an existing
      machine with an outdated or broken PostgreSQL:
```

## Author

&copy; 2015-2016 Konstantin Gredeskoul, portions of this code were donated by [Shippo, Inc.](http://goshippo.com) and used with permisssion.
