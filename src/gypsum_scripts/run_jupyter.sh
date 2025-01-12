#!/bin/bash
#SBATCH --partition titanx-long
#SBATCH --gres gpu:2
#SBATCH --mem=240000
#SBATCH --output jupyter-notebook.log

# get tunneling info
XDG_RUNTIME_DIR=""
port=$(shuf -i8000-9999 -n1)
node=$(hostname -s)
user=$(whoami)
cluster=$(hostname -f | awk -F"." '{print $1}')

# print tunneling instructions jupyter-log
echo -e "
MacOS or linux terminal command to create your ssh tunnel:
ssh -L ${port}:${node}:${port} -N ${user}@gypsum.cs.umass.edu
   
Use a Browser on your local machine to go to:
localhost:${port}  (prefix w/ https:// if using password)
"

# load modules or conda environments here
# e.g. farnam:
# module load Python/2.7.13-foss-2016b

# DON'T USE ADDRESS BELOW. 
# DO USE TOKEN BELOW
jupyter-notebook --no-browser --port=${port} --ip=${node}
