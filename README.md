LAL suite on vagrant
====================

Builds the the [LAL suite][LAL] on a Scientific Linux 6.5 VM.

From-scratch instructions for the Mac
=====================================

Assuming you have a new Mac OS X machine, this should get you set up with LAL.


Install various packages
------------------------

Get [Homebrew][Homebrew] installed for package management.
```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Get the [Brew Cask][Cask] add-on to Homebrew.
```bash
brew install caskroom/cask/brew-cask
```

Install [Vagrant][Vagrant] and [VirtualBox][VirtualBox].
```bash
brew cask install vagrant
brew cask install virtualbox
```

Get this repository with its `Vagrantfile`
```bash
git clone https://github.com/waisbrot/lalsuite-vagrant.git
cd lalsuite-vagrant
```

Start Vagrant. It will download a large base VM image, then install various
prerequisites, then fetch the latest version of the LAL code, then build it.
```bash
vagrant up
```

Get a shell on the VM so you can work:
```bash
vagrant ssh
```

[LAL]: https://www.lsc-group.phys.uwm.edu/daswg/docs/howto/lal-install.html
[Homebrew]: http://brew.sh/
[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/
