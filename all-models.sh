echo "this file is not designed to be executed as a single bash script"
exit 1

# run this from the stable-diffusion-webui directory

## Checkpoints

# Realistic Vision V5.1
# https://civitai.com/models/4201/realistic-vision-v51
wget -O ./models/Stable-diffusion/realisticVisionV51_v51VAE.safetensors https://civitai.com/api/download/models/130072 
# inpainting
wget -O ./models/Stable-diffusion/realisticVisionV51_v51VAE-inpainting.safetensors https://civitai.com/api/download/models/130090 


# Dreamshaper 8
# https://civitai.com/models/4384/dreamshaper
wget -O ./models/Stable-diffusion/dreamshaper_8.safetensors https://civitai.com/api/download/models/128713 
# inpainting
wget -O ./models/Stable-diffusion/dreamshaper_8Inpainting.safetensors https://civitai.com/api/download/models/131004 

# epiCRealism - pure Evolution v5
# https://civitai.com/models/25694/epicrealism
wget -O ./models/Stable-diffusion/epicrealism_pureEvolutionV5.safetensors https://civitai.com/api/download/models/134065 
# inpainting
wget -O ./models/Stable-diffusion/epicrealism_pureEvolutionV5-inpainting.safetensors https://civitai.com/api/download/models/134361 

# Deliberate v2
# https://civitai.com/models/4823/deliberate
wget -O ./models/Stable-diffusion/deliberate_v2.safetensors https://civitai.com/api/download/models/15236 

# # Dark Pizza XL Origin 大个披萨XL 原味儿
# # https://civitai.com/models/123008?modelVersionId=138568
# wget -O ./models/Stable-diffusion/darkPizzaXLOriginXL_v20.safetensors https://civitai.com/api/download/models/138568 

# RPG
# https://civitai.com/models/1116?modelVersionId=124626
wget -O ./models/Stable-diffusion/rpg_v5.safetensors https://civitai.com/api/download/models/124626



## ckpt

# Inkpunk Diffusion
# https://civitai.com/models/1087/inkpunk-diffusion
wget -O ./models/Stable-diffusion/inkpunkDiffusion_v2.ckpt https://civitai.com/api/download/models/1138 




## Loras

# detail tweaker
# https://civitai.com/models/58390/detail-tweaker-lora-lora
wget -O ./models/Lora/ https://civitai.com/api/download/models/62833 add_detail.safetensors

# hairdetailer
# https://civitai.com/models/81328
wget -O ./models/Lora/ https://civitai.com/api/download/models/86284 hairdetailer.safetensors

# epi_noiseoffset
# https://civitai.com/models/13941/epinoiseoffset
wget -O ./models/Lora/ https://civitai.com/api/download/models/16576 epi_noiseoffset2.safetensors

# LowRA
# https://civitai.com/models/48139/lowra
wget -O ./models/Lora/ https://civitai.com/api/download/models/63006 LowRA.safetensors


## embeddings

# Deep Negative V1.x
# https://civitai.com/models/4629/deep-negative-v1x
wget -O ./embeddings/ https://civitai.com/api/download/models/5637 ng_deepnegative_v1_75t.pt

# Style Asian Less
# https://civitai.com/models/50755?modelVersionId=57451
wget -O ./embeddings/Asian-Less-Neg.pt https://civitai.com/api/download/models/57451 

# Gender Slider
# use like this:   (GS-Masculine:0.8)
# https://civitai.com/models/89709?modelVersionId=95959
# DeMasculate Negative
wget -O ./embeddings/GS-DeMasculate-neg.pt https://civitai.com/api/download/models/95959
wget -O ./embeddings/GS-DeFeminize-neg.pt https://civitai.com/api/download/models/95500
wget -O ./embeddings/GS-DeFeminize-neg.pt https://civitai.com/api/download/models/95532
wget -O ./embeddings/GS-Boyish.pt https://civitai.com/api/download/models/95611
wget -O ./embeddings/GS-Girlish.pt https://civitai.com/api/download/models/96322
wget -O ./embeddings/GS-Womanly.pt https://civitai.com/api/download/models/96916
wget -O ./embeddings/GS-DeMasculate-neg.pt https://civitai.com/api/download/models/95959



## SDXL
# installation guide: https://aituts.com/sdxl/
# SDXL Base model
wget -P ./models/Stable-diffusion https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors
wget -P ./models/Stable-diffusion https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors
wget -P ./models/VAE https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors

# Dreamshaper XL
# https://civitai.com/models/112902
wget -O ./models/Stable-diffusion/dreamshaperXL10_alpha2Xl10.safetensors https://civitai.com/api/download/models/126688


# Juggernaut XL
# https://civitai.com/models/133005
wget -O ./models/Stable-diffusion/juggernautXL_version1.safetensors https://civitai.com/api/download/models/146359


## Control Net models
# https://huggingface.co/lllyasviel/ControlNet/tree/main/models
# https://github.com/Mikubill/sd-webui-controlnet
# install this from url in a1111:
# https://github.com/Mikubill/sd-webui-controlnet.git
git clone https://github.com/Mikubill/sd-webui-controlnet.git ./extensions/
# note: no filename is specified because huggingface doesn't fuck shit up like civitai does
wget -P ./extensions/sd-webui-controlnet/models https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_canny.pth
wget -P ./extensions/sd-webui-controlnet/models https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_depth.pth
wget -P ./extensions/sd-webui-controlnet/models https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_hed.pth
wget -P ./extensions/sd-webui-controlnet/models https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_mlsd.pth
wget -P ./extensions/sd-webui-controlnet/models https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_normal.pth
wget -P ./extensions/sd-webui-controlnet/models https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_openpose.pth
wget -P ./extensions/sd-webui-controlnet/models https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_scribble.pth
wget -P ./extensions/sd-webui-controlnet/models https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_seg.pth


