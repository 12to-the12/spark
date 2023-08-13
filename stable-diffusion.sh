#!/bin/bash
# run this from the stable-diffusion-webui directory


## Checkpoints

# Realistic Vision V5.1
# https://civitai.com/models/4201/realistic-vision-v51
wget -P ./models/Stable-diffusion https://civitai.com/api/download/models/62833
# inpainting
wget -P ./models/Stable-diffusion https://civitai.com/api/download/models/130090


# Dreamshaper 8
# https://civitai.com/models/4384/dreamshaper
wget -P ./models/Stable-diffusion https://civitai.com/api/download/models/128713
# inpainting
wget -P ./models/Stable-diffusion https://civitai.com/api/download/models/131004

# epiCRealism - pure Evolution v5
# https://civitai.com/models/25694/epicrealism
wget -P ./models/Stable-diffusion https://civitai.com/api/download/models/134065
# inpainting
wget -P ./models/Stable-diffusion https://civitai.com/api/download/models/134361

# Deliberate v2
# https://civitai.com/models/4823/deliberate
wget -P ./models/Stable-diffusion https://civitai.com/api/download/models/15236

## Loras

# detail tweaker
# https://civitai.com/models/58390/detail-tweaker-lora-lora
wget -P ./models/Lora https://civitai.com/api/download/models/62833

# hairdetailer
# https://civitai.com/models/81328
wget -P ./models/Lora https://civitai.com/api/download/models/86284

# epi_noiseoffset
# https://civitai.com/models/13941/epinoiseoffset
wget -P ./models/Lora https://civitai.com/api/download/models/16576

# LowRA
# https://civitai.com/models/48139/lowra
wget -P ./models/Lora https://civitai.com/api/download/models/63006


## embeddings

# Deep Negative V1.x
# https://civitai.com/models/4629/deep-negative-v1x
wget -P ./embeddings https://civitai.com/api/download/models/5637

# Style Asian Less
# https://civitai.com/models/50755?modelVersionId=57451
wget -P ./embeddings https://civitai.com/api/download/models/57451

# Gender Slider
# https://civitai.com/models/89709?modelVersionId=95959
# DeMasculate Negative
wget -P ./embeddings https://civitai.com/api/download/models/95959
# DeFeminize Negative
wget -P ./embeddings https://civitai.com/api/download/models/95500
# DeFeminize Masculine
wget -P ./embeddings https://civitai.com/api/download/models/95532
# DeFeminize Boyish
wget -P ./embeddings https://civitai.com/api/download/models/95611
# DeFeminize Girlish
wget -P ./embeddings https://civitai.com/api/download/models/96322
# DeFeminize Womanly
wget -P ./embeddings https://civitai.com/api/download/models/96916