cd ..
# all params but the first one
srun -K \
    --time=48:00:00 \
    --partition=$1 \
    --mem-per-cpu=4G \
    --ntasks=1 \
    --cpus-per-task=$2 \
    --gpus-per-task=0 \
    --nodes=1 \
    --container-image=/netscratch/martelleto/OrganSeg.sqsh \
    --container-workdir="`pwd`" \
    --container-mounts=/home/martelleto/:/home/martelleto/,/netscratch:/netscratch/ \
   pip install -e . && export nnUNet_raw=/netscratch/martelleto/nnUNet/nnUNet_raw && export nnUNet_preprocessed=/netscratch/martelleto/nnUNet/nnUNet_preprocessed && export nnUNet_results=/netscratch/martelleto/nnUNet/nnUNet_results && ${@:2}
