. /etc/profile.d/lal-prep.sh

export LSCSOFT_ROOTDIR=
export LSCSOFT_SRCDIR=/opt/src/lscsoft

# configure Git
git config --global user.name "Anonymous"
git config --global user.email anonymous@example.com

mkdir -p $LSCSOFT_SRCDIR
cd $LSCSOFT_SRCDIR
git clone git://ligo-vcs.phys.uwm.edu/lalsuite.git .
./00boot && ./configure && make && make install
