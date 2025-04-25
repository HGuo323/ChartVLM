# The name of experiment
name=VLT5

output=snap/vqa/$name

PYTHONPATH=$PYTHONPATH:./src \
torchrun \
    --nproc_per_node=$1 \
    Models/VL-T5/src/vqa_inference.py \
        --distributed --multiGPU \
        --test test \
        --num_workers 8 \
        --backbone 't5-base' \
        --output 'predictions/' \
        --load VLT5_output/BEST \
        --num_beams 5 \
        --valid_batch_size 32 \
        --src_folder "data2/content/ChartQA/data/" \
        --raw_label \
        --fp16 \
        --use_vis_order_embedding False \
