. /etc/profile.d/lal-prep.sh

set -ex

export LSCSOFT_ROOTDIR=
export LSCSOFT_SRCDIR=/opt/src/lscsoft

# configure Git
git config --global user.name "Anonymous"
git config --global user.email anonymous@example.com

mkdir -p $LSCSOFT_SRCDIR
cd $LSCSOFT_SRCDIR
if [ -d .git ]; then
  git pull
else
  git clone git://ligo-vcs.phys.uwm.edu/lalsuite.git .
fi
./00boot
./configure --prefix=/opt/lscsoft
make
sudo make install

for s in /opt/lscsoft/etc/*.{sh,csh}; do
  sudo ln -s $s /etc/profile.d/
done
