# Pullulant
## Bootstrap Your Dev Environment on Mac OS-X in Minutes

Just tell me what to run, I don't have time for this README.

```bash
curl -fsSL 'http://sw.im/pu-bootstrap' | /usr/bin/env bash
```

Alternatively, for a finer graned control of your installation, do the following:

```bash
mkdir -p ~/workspace && cd ~/workspace
git clone https://github.com/kigster/pullulant 
cd pullulant 
./pu -a -t ruby -t python -t nodejs -t web [ -f ] [ -iI ] 
```

## Pu-what?

"Pullulant" – it is Latin for "Sprout". [Sprout-Wrap](https://github.com/pivotal-sprout/sprout-wrap) was an inspiration for this install, as well as initially a large chunk of it, so the names gives credit where credit is due.  As pullulant became more mature, the role of SproutWrap in the install process shrunk significantly, and eventually it will be removed completely.

## Why Should I Use This?

This project is the basis for setting local dev environment of several San Francisco startups and independents – it captures the setup that originated as a small wrapper around [Sprout-Wrap](https://github.com/pivotal-sprout/sprout-wrap) cookbook. But the cookbooks were too small and too brittle, and kind of difficult to fix (see appendix 1). So the shell script grew.

Now Pullulant combines hundreds of small steps into modular chunks that run one after another as part of a fully automated (even unattended) setup of the development environment. This is a great setup for projects involving building javascript, nodejs, ruby, python, C/C++, or even Arduino applications on Mac OS-X. This installer condenses a ton of personal experience and taste and merges it with that of Pivotal Labs. It's design gives you an easy way to use modules that can be run all at once, or one at a time.

The installer relies on [HomeBrew](http://brew.sh/), [Sprout-Wrap](https://github.com/pivotal-sprout/sprout-wrap), and about 3K lines of bash scripting to deliver your shell goodies to the door, all while customizing your environment to look like and serve you, the oh-mightly-powerful Developer, with all of it's shine. Try it! :)

I mean – just check out the sexy BASH prompt (based on the 'Powerline Multiline' theme and "Bash-It" framework) that you will get after running it :)

![Pu Usage](doc/pu-bash.png)

## Pre-Install – OS-X Preparation

  1. Run `xcode-select --install` to make sure you have dev tools (although installer will still run it in the beginning)
  2. Run OS-X Updates if any, and reboot if requested.
  3. Go to _System Preferences / Sharing_, unlock the panel and set the hostname of your system, if it's currently set to a default.

### About your OS-X user

Note: shared resources used by the Homebrew, such as files under `/usr/local`,
will change ownership to the user running this installer, with full `xwr`
permissions for user and the group. This is so that the effects of any
previously run `sudo brew` nuisance are neutralized.

Typically your group will be `staff`.  Whatever group you are, that group is
applied to the folder list defined in config (`/usr/local` and `/var/chef`), with
permissions also reset to `xwr`. The idea is that this move should permit
multiple co-existing users to share `/usr/local` and `/var/chef` at the same time.  

Note that the current OS-X user must be configured as "Admin" on the Mac, and upon
entering their password after the first request for `sudo`, the user will be
modified to allow password-less `sudo` access for the duration of the script.
At the end of the script, that access is removed.

You can use the helpers to enable/disable password-less sudo in your environment,
by running `./pu -r sudo-enable` or `./pu -r sudo-disable`.

## Install

  1. If you don't already have SSH keys setup on this machine, now is the time: `ssh-keygen -t rsa -b 4096 -C "${USER}@${HOSTNAME}"; cat ~/.ssh/id_rsa.pub | pbcopy`
  2. Add the new SSH key to the Github settings page: https://github.com/settings/ssh
  3. Run the following installer:

```bash
  curl -fsSL 'http://sw.im/pu-bootstrap' | /usr/bin/env bash
```

## After a Successful Install

 * Reboot (required after the first successful install!) or you may get weird
   Security Agent errors.
 * Open System Preferences, Security & Privacy, choose Privacy tab and
   unlock the lock at the bottom. After that choose Accessibility and then check "ShiftIt" application.
 * Search in Spotlight, and start the following apps:
    * iStat Menus – click install when it comes up
    * Alfred 2

## What's Installed

### Languages

This setup is tailored for web application development, and it's default set
of packages is definitely biased towards ruby, installing both `rbenv` and `ruby-build`.  

That said, tools such as `pyenv` are also installed, which makes installing multiple
versions of `python` a breeze. Similarly, `npm` and `bower` are both installed by default.

### Developer Necessities

  * iTerm2 – mandatory replacement for Terminal :)
  * ShiftIt – use Ctrl-Option-Cmd with arrows to quickly align windows on the screen.
  * iStatMenus
  * Typical services needed for building web applications:
    * PostgreSQL 9.5
    * nginx
    * haproxy
    * Redis
    * memcached
    * ElasticSearch
    * AWS CLI
    * CMake
    * rsync

### Git

  * Git aliases
  * `hub` tool for GitHub with autocompletion on zsh
  * Git scripts for pair programming `git pair`
  * Git global defaults used by professional developers
  * GitX Application
  * Github Application

### Editors & OS-X Applications

  * RubyMine (JetBrains ruby IDE)
  * WebStorm (JetBrains JavaScript IDE)
  * CLion (JetBrains C++ IDE)
  * vim
  * Github's Atom
  * TeamViewer for remote pair programming
  * Docker toolbox + Kitematic
  * VirtualBox
  * Slack
  * GitX

### Shells

 * Bash and Bash Completion are both installed
 * Zsh and Oh-My-Zsh are installed, and zsh is made the default (unless `-Z` flag is passed)

### Programming Fonts

 * Powerline Fonts for the iTerm2 are installed, so that you get a great choice of
   coding fonts on a Mac. Powerline fonts are also required if you want to use
   'reinvent-one' zsh prompt theme.

### Google

 * Chrome
 * Drive
 * Hangouts

## Driving the Installer

![Pu Usage](doc/pu.png)

You should inspect the configuration and packages defined in two files:

 * `lib/pu-config`
 * `lib/pu-packages`

Variables with names starting with `var_` can be overridden before running the
script. So can all the variables set in the `pu-packages` file, such as
which brew formulas or casks to install.

You can also copy the file `sample-config/.pullulant_packages` to your home folder,
and modify it there to suit your needs. This file is loaded before any packages
are defined, and overrides the packages the script itself defines.

## Acknowledgements

&copy; 2015-2016 Konstantin Gredeskoul, portions of the code were developed under
the generous sponsorship of [Shippo, Inc.](http://goshippo.com) and are used
with permission.

The following people assisted in building this tool:

 * Wissam Jarjoui
 * Subhi Beidas
 * Dennis Rohm

## Appendix

 1. SproutWrap is difficult to fix when it breaks. For each sprout-something cookbook you must fork it first, fix the problem, then fork sprout-wrap, point to your fixed version in the Cheffile, then run it your forked version, and also maintain it until Pivotal merges your changes. Just not really that awesome of a process.
