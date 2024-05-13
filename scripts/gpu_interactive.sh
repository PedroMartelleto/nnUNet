cd ..
srun -K \
    --time=24:00:00 \
    --partition=$1 \
    --mem-per-cpu=14G \
    --ntasks=1 \
    --cpus-per-task=10 \
    --gpus-per-task=1 \
    --nodes=1 \
    --container-image=/netscratch/martelleto/OrganSeg.sqsh \
    --container-workdir="`pwd`" \
    --container-mounts=/home/martelleto/:/home/martelleto/,/netscratch:/netscratch/ \
    --pty bash \
    # --container-image=/netscratch/martelleto/OrganSeg.sqsh \
#    pip install -e .
#    export nnUNet_raw=/netscratch/martelleto/nnUNet/nnUNet_raw
#    export nnUNet_preprocessed=/netscratch/martelleto/nnUNet/nnUNet_preprocessed
#    export nnUNet_results=/netscratch/martelleto/nnUNet/nnUNet_results
