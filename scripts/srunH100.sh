cd ..
# all params but the first one
srun -K \
    --time=24:00:00 \
    --partition=H100 \
    --mem-per-cpu=25G \
    --ntasks=1 \
    --cpus-per-task=8 \
    --gpus-per-task=1 \
    --nodes=1 \
    --container-image=/netscratch/martelleto/OrganSeg.sqsh \
    --container-workdir="`pwd`" \
    --container-mounts=/home/martelleto/:/home/martelleto/,/netscratch:/netscratch/ \
   ./wandb.sh ${@:1}
