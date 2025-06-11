#!/bin/sh

export num_jobs=1
export cores_per_job=20

export total_cores=$((${num_jobs} * ${cores_per_job}))

#SBATCH --job-name=ramble_LiH
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=20

module load gnu12
module load openmpi4/4.1.6
export LD_LIBRARY_PATH=/usr/lib64/:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/lib64/:$LIBRARY_PATH
export LD_LIBRARY_PATH=/home/SharedExe/openblas:/home/SharedExe/libs/$LD_LIBRARY_PATH
export LIBRARY_PATH=/home/SharedExe/openblas:/home/SharedExe/libs/$LD_LIBRARY_PATH


ramble -ompnp ${cores_per_job} -t -te 10 -ts 0.1 -dr 0 -tt 500 -p 0 -m 10000 LiH-coex > ramble.out 2> ramble.err
