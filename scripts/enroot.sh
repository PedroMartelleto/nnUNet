cd ..
srun -K \
    --time=20:00:00 \
    --partition=$1 \
    --mem-per-cpu=8G \
    --ntasks=1 \
    --cpus-per-task=10 \
    --gpus-per-task=1 \
    --nodes=1 \
    --container-image=/netscratch/martelleto/OrganSeg.sqsh \
    --container-save=/netscratch/martelleto/OrganSeg.sqsh \
    --container-workdir="`pwd`" \
    --container-mounts=/home/martelleto/:/home/martelleto/,/netscratch:/netscratch/ \
    pip install -r requirements.txt