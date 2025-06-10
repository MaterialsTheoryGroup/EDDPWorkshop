timestep=1 # timestep in fs
temp=1000 # temperature in K
press=0 # pressure in GPa
num_steps=200001 # number of steps

ramble -ompnp 8 -t -te 50 -ts $timestep -dr 0 -tt $temp -p $press -m $num_steps LiH-coex > ramble.out 2> ramble.err
