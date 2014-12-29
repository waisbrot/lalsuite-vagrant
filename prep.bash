function install_src {
  set -ex
  local url=$1
  shift
  local filename=${url##*/}
  local dirname=${filename%.tar.gz}
  if pkg-config $dirname; then
    return
  fi
  cd /tmp
  if [ ! -d $dirname ]; then
    wget $url -O - | tar xzf -
  fi
  cd $dirname
  ./configure
  make
  sudo make install
}

sudo yum -y groupinstall "Development tools"
sudo yum -y groupinstall "Additional Development"
sudo yum install -y zlib-devel fftw-devel libxml2-devel glib2-devel

SRCPKGS=(
  'http://mirrors.ibiblio.org/gnu/ftp/gnu/gsl/gsl-1.16.tar.gz'
  'http://lappweb.in2p3.fr/virgo/FrameL/libframe-8.21.tar.gz'
  'https://www.lsc-group.phys.uwm.edu/daswg/download/software/source/metaio-8.3.0.tar.gz'
)

for pkg in ${SRCPKGS[@]}; do
  install_src $pkg
done

cat <<EOF > /tmp/lal-prep.sh
  export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/lib64/pkgconfig
  export LD_LIBRARY_PATH=/usr/local/lib
EOF
sudo cp /tmp/lal-prep.sh /etc/profile.d/lal-prep.sh
