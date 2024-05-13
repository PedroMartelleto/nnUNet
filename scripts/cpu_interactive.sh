cd ..
srun -K \
    --time=20:00:00 \
    --partition=$1 \
    --mem-per-cpu=8G \
    --ntasks=1 \
    --cpus-per-task=6 \
    --gpus-per-task=0 \
    --nodes=1 \
    --container-image=/netscratch/martelleto/OrganSeg.sqsh \
    --container-workdir="`pwd`" \
    --container-mounts=/home/martelleto/:/home/martelleto/,/netscratch:/netscratch/ \
    --pty bash
