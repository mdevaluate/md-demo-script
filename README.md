# mdevaluate example script

This is a small script that demonstrates the installation and use of mdevaluate.
The included setup.sh script is intended for a linux 64-bit systems, see https://conda.io/miniconda.html if you are using a different system.
The script will

1. Install a lokal Python 3 (miniconda)
2. Install necessary Python packages
3. Download and install pygmx and mdevaluate

The accompanying Python script isf.py will compute the incoherent scattering function from existing simulation data.
Follow the comments inside this file to adjust the script to your needs.

## How to install

A development version of Gromacs 2016 has to be installed, on many linux systems, this is available through the package manager, 
search for packages named gromacs and gromacs-dev[el] and install them on your system.
Furthermore the script requires git to download the Python source.

Then run the setup.sh script on the commandline:
	
	bash setup.py

## How to uninstall

Everything that is installed by this script is contained within this folder.
To uninstall it, simply remove the folder.
