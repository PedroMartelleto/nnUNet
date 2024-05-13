SCRIPTS LOCATION (for generating datasets):
    TotalSegmentator/

export nnUNet_n_proc_DA=

PLAN: Four trainings
    1. With and without thresholded dataset 2x (nnUNetPlannerResEncM)
    2. With and without more augs (nnUNetPlannerResEncM, change trainer)
    3. 4x planners with dataset 400
        ExperimentPlanner
        nnUNetPlannerResEncM
        nnUNetPlannerResEncL
        nnUNetPlannerResEncXL

<!-- ./srunCPU.sh A100-40GB nnUNetv2_plan_and_preprocess -d 400 -pl ExperimentPlanner -c 3d_fullres -np 8 -->
nnUNetv2_plan_experiment -d 400 -pl nnUNetPlannerResEncM -c 3d_fullres -np 8
nnUNetv2_plan_experiment -d 400 -pl nnUNetPlannerResEncL -c 3d_fullres -np 8
nnUNetv2_plan_experiment -d 400 -pl nnUNetPlannerResEncXL -c 3d_fullres -np 8

./srunCPU.sh A100-40GB nnUNetv2_plan_and_preprocess -d 600 -pl ExperimentPlanner -c 3d_fullres -np 8
nnUNetv2_plan_experiment -d 600 -pl nnUNetPlannerResEncM -c 3d_fullres -np 8
nnUNetv2_plan_experiment -d 600 -pl nnUNetPlannerResEncL -c 3d_fullres -np 8
nnUNetv2_plan_experiment -d 600 -pl nnUNetPlannerResEncXL -c 3d_fullres -np 8

THRESHOLDED DATASET: /netscratch/martelleto/nnUNet/nnUNet_raw/Dataset400_nnunet/
NOT-THRESHOLDED DATASET: /netscratch/martelleto/nnUNet/nnUNet_raw/Dataset600_NotThresholded/

1.
export nnUNet_raw=/netscratch/martelleto/nnUNet/nnUNet_raw && export nnUNet_preprocessed=/netscratch/martelleto/nnUNet/nnUNet_preprocessed && export nnUNet_results=/netscratch/martelleto/nnUNet/nnUNet_results

- Dataset400_nnunet
- Dataset600_NotThresholded

2.

nnUNetv2_train 400 3d_fullres 0 -tr nnUNetTrainerMinimalDA

3.

./srunGPU.sh A100-40GB 32 