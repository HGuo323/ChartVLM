# The name of experiment
name=VLT5

output=snap/vqa/$name

PYTHONPATH=$PYTHONPATH:./src \
torchrun \
    --nproc_per_node=$1 \
    Models/VL-T5/src/vqa.py \
        --distributed --multiGPU \
        --train train \
        --valid val \
        --test test \
        --optim adamw \
        --warmup_ratio 0.05 \
        --clip_grad_norm 5 \
        --lr 3e-5 \
        --epochs 15 \
        --num_workers 16 \
        --backbone 't5-base' \
        --output 'VLT5_output/' \
        --load Epoch30 \
        --num_beams 5 \
        --batch_size 32 \
        --valid_batch_size 64 \
        --src_folder "data2/content/ChartQA/data/" \
        --raw_label \
        --fp16 \
