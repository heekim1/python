#!/usr/bin/env bash

set -ex

PYTHON_PIP_VERSION=8.1.2
PYTHON_INSTALL_PATH=/bfx/bin/python/${PYTHON_VERSION}

export PATH=$PYTHON_INSTALL_PATH/bin:$PATH
export LD_LIBRARY_PATH=$PYTHON_INSTALL_PATH/lib

cd /usr/src/python
tar --strip-components=1 --skip-old-files -xJf python.tar.xz -C /usr/src/python
./configure --enable-loadable-sqlite-extensions \
            --enable-shared \
            --prefix=${PYTHON_INSTALL_PATH} \
            --enable-optimizations
make -j$(nproc)
make install
ldconfig

# this will force install PIP with the version specified.
# by default, python will install the latest version of PIP
if [ ! -e $PYTHON_INSTALL_PATH/bin/pip3 ]; then
  wget -O /tmp/get-pip.py 'https://bootstrap.pypa.io/get-pip.py'
  python3 /tmp/get-pip.py "pip==$PYTHON_PIP_VERSION"
fi
pip3 install --no-cache-dir --upgrade --force-reinstall "pip==$PYTHON_PIP_VERSION"

cd $PYTHON_INSTALL_PATH/bin
[ -e easy_install ] || ln -s easy_install-* easy_install;
ln -s idle3 idle || true
ln -s pydoc3 pydoc || true
ln -s python3 python || true
ln -s python3-config python-config || true

# Python modules from pip  
cat <<EOF > /tmp/python_pip_requirements.txt
numpy==1.13.1
scipy==1.0.0
Cython==0.26
pysam==0.11.2.2
matplotlib==2.0.2
pandas==0.21.0
flask==1.0.2
pyvcf==0.6.8
biopython==1.70
scikit-learn==0.19.1
requests==2.20.0
statsmodels==0.8.0
pytabix==0.0.2
cnvkit==0.9.3
cutadapt==1.16
EOF

pip3 install -r /tmp/python_pip_requirements.txt

echo "Installed packages are:"
pip3 freeze