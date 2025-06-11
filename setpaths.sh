module load gnu12
module load openmpi4/4.1.6

export PATH=/home/CAMusers/eddp_test_peter_yargla/gitrepo/ddp/bin:/home/CAMusers/eddp_test_peter_yargla/gitrepo/nn/bin:/home/CAMusers/eddp_test_peter_yargla/gitrepo/repose/bin:/home/CAMusers/eddp_test_peter_yargla/gitrepo/airss/bin:$PATH


export PATH=~/eddp_test_peter_yargla/gitrepo/castep/obj/linux_x86_64_gfortran10--mpi/:~/eddp_test_peter_yargla/gitrepo/castep/obj/linux_x86_64_gfortran10--serial/:$PATH

export LD_LIBRARY_PATH=/usr/lib64/:$LD_LIBRARY_PATH

export LIBRARY_PATH=/usr/lib64/:$LIBRARY_PATH
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export DDPBATCH='/home/CAMusers/eddp_test_peter_yargla/gitrepo/ddp-batch/bin'
export PATH="$DDPBATCH:$PATH"
