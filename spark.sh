echo "this file is not designed to be executed as a single bash script"
echo "it will printout instead"
curl -sL https://raw.githubusercontent.com/12to-the12/spark/main/spark.sh
exit 1


# run this to get a mac set up with stable diffusion
sh < (curl -sL https://raw.githubusercontent.com/12to-the12/spark/main/mac-stable-diffusion.sh)