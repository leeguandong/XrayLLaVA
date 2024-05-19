# Experimental environment: 3090
# 23GB GPU memory
NPROC_PER_NODE=4 CUDA_VISIBLE_DEVICES=0,1,2,3 swift sft \
  --model_type llava1d6-mistral-7b-instruct  \
  --model_id_or_path /home/image_team/image_team_docker_home/lgd/e_commerce_lmm/weights/llava-v1.6-mistral-7b/   \
  --dataset /home/image_team/image_team_docker_home/lgd/e_commerce_lmm/data/open-zh-swift-llava-prompt.json \
  --sft_type lora \
  --tuner_backend peft \
  --template_type AUTO \
  --dtype AUTO \
  --output_dir /home/image_team/image_team_docker_home/lgd/e_commerce_lmm/results/llava16_swift_xray/ \
  --train_dataset_sample -1 \
  --num_train_epochs 20 \
  --max_length 2048 \
  --check_dataset_strategy warning \
  --lora_rank 8 \
  --lora_alpha 32 \
  --lora_dropout_p 0.05 \
  --lora_target_modules ALL \
  --gradient_checkpointing true \
  --batch_size 2 \
  --weight_decay 0.1 \
  --learning_rate 1e-4 \
  --gradient_accumulation_steps 8 \
  --max_grad_norm 0.5 \
  --warmup_ratio 0.03 \
  --eval_steps 1000 \
  --save_steps 500 \
  --save_total_limit 10 \
  --logging_steps 10 \
  --use_flash_attn false \
  --deepspeed default-zero2 \