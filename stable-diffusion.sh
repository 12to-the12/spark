#!/bin/bash
# run this from the stable-diffusion-webui directory


## Checkpoints

# Realistic Vision V5.1
# https://civitai.com/models/4201/realistic-vision-v51
wget -P ./models/Stable-diffusion/ https://civitai.com/api/download/models/130072 --output-document=realisticVisionV51_v51VAE.safetensors
# inpainting
wget -P ./models/Stable-diffusion/ https://civitai.com/api/download/models/130090 --output-document=realisticVisionV51_v51VAE-inpainting.safetensors


# Dreamshaper 8
# https://civitai.com/models/4384/dreamshaper
wget -P ./models/Stable-diffusion/ https://civitai.com/api/download/models/128713 --output-document=dreamshaper_8.safetensors
# inpainting
wget -P ./models/Stable-diffusion/ https://civitai.com/api/download/models/131004 --output-document=dreamshaper_8Inpainting.safetensors

# epiCRealism - pure Evolution v5
# https://civitai.com/models/25694/epicrealism
wget -P ./models/Stable-diffusion/ https://civitai.com/api/download/models/134065 --output-document=epicrealism_pureEvolutionV5.safetensors
# inpainting
wget -P ./models/Stable-diffusion/ https://civitai.com/api/download/models/134361 --output-document=epicrealism_pureEvolutionV5-inpainting.safetensors

# Deliberate v2
# https://civitai.com/models/4823/deliberate
wget -P ./models/Stable-diffusion/ https://civitai.com/api/download/models/15236 --output-document=deliberate_v2.safetensors

## Loras

# detail tweaker
# https://civitai.com/models/58390/detail-tweaker-lora-lora
wget -P ./models/Lora/ https://civitai.com/api/download/models/62833 --output-document=add_detail.safetensors

# hairdetailer
# https://civitai.com/models/81328
wget -P ./models/Lora/ https://civitai.com/api/download/models/86284 --output-document=hairdetailer.safetensors

# epi_noiseoffset
# https://civitai.com/models/13941/epinoiseoffset
wget -P ./models/Lora/ https://civitai.com/api/download/models/16576 --output-document=epi_noiseoffset2.safetensors

# LowRA
# https://civitai.com/models/48139/lowra
wget -P ./models/Lora/ https://civitai.com/api/download/models/63006 --output-document=LowRA.safetensors


## embeddings

# Deep Negative V1.x
# https://civitai.com/models/4629/deep-negative-v1x
wget -P ./embeddings/ https://civitai.com/api/download/models/5637 --output-document=ng_deepnegative_v1_75t.pt

# Style Asian Less
# https://civitai.com/models/50755?modelVersionId=57451
wget -P ./embeddings/ https://civitai.com/api/download/models/57451 --output-document=Asian-Less-Neg.pt

# Gender Slider
# use like this:   (GS-Masculine:0.8)
# https://civitai.com/models/89709?modelVersionId=95959
# DeMasculate Negative
wget -P ./embeddings/ https://civitai.com/api/download/models/95959 --output-document=GS-DeMasculate-neg.pt
# DeFeminize Negative
wget -P ./embeddings/ https://civitai.com/api/download/models/95500 --output-document=GS-DeFeminize-neg.pt
# DeFeminize Masculine
wget -P ./embeddings/ https://civitai.com/api/download/models/95532 --output-document=GS-Masculine.pt
# DeFeminize Boyish
wget -P ./embeddings/ https://civitai.com/api/download/models/95611 --output-document=GS-Boyish.pt
# DeFeminize Girlish
wget -P ./embeddings/ https://civitai.com/api/download/models/96322 --output-document=GS-Girlish.pt
# DeFeminize Womanly
wget -P ./embeddings/ https://civitai.com/api/download/models/96916 --output-document=GS-Womanly.pt

## Control Net models
# https://huggingface.co/lllyasviel/ControlNet/tree/main/models
# https://github.com/Mikubill/sd-webui-controlnet
# install this from url in a1111:
# https://github.com/Mikubill/sd-webui-controlnet.git
git clone https://github.com/Mikubill/sd-webui-controlnet.git ./extensions/
# note: no filename is specified because huggingface doesn't fuck shit up like civitai does
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_canny.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_depth.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_hed.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_mlsd.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_normal.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_openpose.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_scribble.pth
wget -P ./extensions/sd-webui-controlnet https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_seg.pth

