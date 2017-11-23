import mdevaluate as md

from functools import partial
import numpy as np

# change filename of result file here...
outfile = 'isf.dat'

# Adjust simulation directory and topolgy/trajectory filenames accordingly...
traj = md.open(
	directory='/data/niels/sim/water/bulk/260K',
	topology='topol.tpr', trajectory='out/traj*.xtc'
)

# Select correct atom/residue type...
traj_subset = traj.subset(atom_name='OW', residue_name='SOL')

# Set scattering vector q...
isf_q = partial(md.correlation.isf, q=22.7)

# Compute the isf...
result = md.correlation.shifted_correlation(
	isf_q, traj_subset,
	window=0.5,  # controlls the anaylsis window of the trajectory
	segments=100,  # controlls the number of averages
	average=True  # controlls if shifted windows are averaged, should normally be True
)

# Save the result to a textfile
np.savetxt(outfile, np.stack(result, axis=1), header='time; isf')
print('Saving result to file {}.'.format(outfile))

