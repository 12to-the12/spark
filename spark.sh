echo "this script is not meant to be run, it will print out information instead:"
curl -sL https://raw.githubusercontent.com/12to-the12/spark/main/spark.sh
exit 1


# run this to get a mac set up with stable diffusion
bash <(curl -sL https://raw.githubusercontent.com/12to-the12/spark/main/mac-stable-diffusion-download.sh)

# run this for a fedora device
bash <(curl -sL https://raw.githubusercontent.com/12to-the12/spark/main/fedora-stable-diffusion-download.sh)
