# for dataset in imagenet
# do
#     python parse_test_res.py --directory output//base2new/train_base/${dataset}/shots_16/PMP/imagenet_k12_ep15
#     python parse_test_res.py --directory output//base2new/test_new/${dataset}/shots_16/PMP/imagenet_k12_ep15 --test-log
#     # python parse_test_res.py --directory pre_results/rpo/base2new/train_base/${dataset}/shots_16/RPO/main_K24
#     # python parse_test_res.py --directory pre_results/rpo/base2new/test_new/${dataset}/shots_16/RPO/main_K24 --test-log
# done

DEFAULT_DATASET=imagenet
# CFG=imagenet_k12_ep15
for dataset in imagenet caltech101 oxford_pets stanford_cars oxford_flowers food101 fgvc_aircraft sun397 dtd eurosat ucf101
do
    if [ "$dataset" = "$DEFAULT_DATASET" ]; then
    CFG=imagenet_k12_ep15
    else
    CFG=main_K12
    fi
    for SHOT in 1 2 4 8 16
    do
    python parse_test_res.py --directory output//few_shots/${dataset}/shots_${SHOT}/PMP/${CFG}
    # python parse_test_res.py --directory output/cocoop/base2new/test_new/${dataset}/shots_16/CoCoOp/${CFG} --test-log
    # python parse_test_res.py --directory pre_results/rpo/base2new/train_base/${dataset}/shots_16/RPO/main_K24
    # python parse_test_res.py --directory pre_results/rpo/base2new/test_new/${dataset}/shots_16/RPO/main_K24 --test-log
    done
done