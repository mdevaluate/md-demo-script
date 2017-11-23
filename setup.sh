
workdir=$(dirname $(realpath $0))
pushd $workdir

# Check that Gromacs 2016 is installed
if ! gmx &>/dev/null
	then
	echo "[ERROR] Gromacs not found."
	exit 1
fi
if [[ ! $(gmx -version | grep "GROMACS version") == *"2016"* ]]
	then
	echo "[ERROR] $(gmx -version | grep "GROMACS version")"
	echo "Make sure to install Gromacs 2016"
	exit 1
fi

# Install and activate miniconda... if necessary
if [ ! -d conda ]
then
	wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
	bash $workdir/Miniconda3-latest-Linux-x86_64.sh -p $workdir/conda -b
fi
source $workdir/conda/bin/activate

# install python dependencies
conda install -y --file requirements.txt

# install pygmx and mdevaluate
source GMXRC
if [ ! -d pygmx ]
then
	git clone https://github.com/mdevaluate/pygmx.git
fi
pushd pygmx
python setup.py install
popd

if [ ! -d mdevaluate ]
then
	git clone https://github.com/mdevaluate/mdevaluate.git
fi
pushd mdevaluate
python setup.py install
popd

if python -c "import mdevaluate"
then
	echo 
	echo "*** ### ***"
	echo "Installation of mdevaluate successfull...!"
	echo "To activate this python version in a new session, run:"
	echo "source $workdir/conda/bin/activate"
fi
