#!/bin/bash
# run this from the stable-diffusion-webui directory


## Checkpoints

# Realistic Vision V5.1
# https://civitai.com/models/4201/realistic-vision-v51
wget -P ./models/Stable-diffusion -O realisticVisionV51_v51VAE.safetensors https://civitai.com/api/download/models/130072
# inpainting
wget -P ./models/Stable-diffusion -O realisticVisionV51_v51VAE-inpainting.safetensors https://civitai.com/api/download/models/130090


# Dreamshaper 8
# https://civitai.com/models/4384/dreamshaper
wget -P ./models/Stable-diffusion -O dreamshaper_8.safetensors https://civitai.com/api/download/models/128713
# inpainting
wget -P ./models/Stable-diffusion -O dreamshaper_8Inpainting.safetensors https://civitai.com/api/download/models/131004

# epiCRealism - pure Evolution v5
# https://civitai.com/models/25694/epicrealism
wget -P ./models/Stable-diffusion -O epicrealism_pureEvolutionV5.safetensors https://civitai.com/api/download/models/134065
# inpainting
wget -P ./models/Stable-diffusion -O epicrealism_pureEvolutionV5-inpainting.safetensors https://civitai.com/api/download/models/134361

# Deliberate v2
# https://civitai.com/models/4823/deliberate
wget -P ./models/Stable-diffusion -O deliberate_v2.safetensors https://civitai.com/api/download/models/15236

## Loras

# detail tweaker
# https://civitai.com/models/58390/detail-tweaker-lora-lora
wget -P ./models/Lora -O add_detail.safetensors https://civitai.com/api/download/models/62833

# hairdetailer
# https://civitai.com/models/81328
wget -P ./models/Lora -O hairdetailer.safetensors https://civitai.com/api/download/models/86284

# epi_noiseoffset
# https://civitai.com/models/13941/epinoiseoffset
wget -P ./models/Lora -O epi_noiseoffset2.safetensors https://civitai.com/api/download/models/16576

# LowRA
# https://civitai.com/models/48139/lowra
wget -P ./models/Lora -O LowRA.safetensors https://civitai.com/api/download/models/63006


## embeddings

# Deep Negative V1.x
# https://civitai.com/models/4629/deep-negative-v1x
wget -P ./embeddings -O ng_deepnegative_v1_75t.pt https://civitai.com/api/download/models/5637

# Style Asian Less
# https://civitai.com/models/50755?modelVersionId=57451
wget -P ./embeddings -O Asian-Less-Neg.pt https://civitai.com/api/download/models/57451

# Gender Slider
# https://civitai.com/models/89709?modelVersionId=95959
# DeMasculate Negative
wget -P ./embeddings -O GS-DeMasculate-neg.pt https://civitai.com/api/download/models/95959
# DeFeminize Negative
wget -P ./embeddings -O GS-DeFeminize-neg.pt https://civitai.com/api/download/models/95500
# DeFeminize Masculine
wget -P ./embeddings -O GS-Masculine.pt https://civitai.com/api/download/models/95532
# DeFeminize Boyish
wget -P ./embeddings -O GS-Boyish.pt https://civitai.com/api/download/models/95611
# DeFeminize Girlish
wget -P ./embeddings -O GS-Girlish.pt https://civitai.com/api/download/models/96322
# DeFeminize Womanly
wget -P ./embeddings -O GS-Womanly.pt https://civitai.com/api/download/models/96916

## Control Net models
# https://huggingface.co/lllyasviel/ControlNet/tree/main/models
# https://github.com/Mikubill/sd-webui-controlnet
# install this from url in a1111:
# https://github.com/Mikubill/sd-webui-controlnet.git
# note: no filename is specified because huggingface doesn't fuck shit up like civitai does
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_canny.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_depth.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_hed.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_mlsd.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_normal.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_openpose.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_scribble.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_seg.pth
