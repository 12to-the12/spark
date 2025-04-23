FROM fedora:latest
WORKDIR /home/testing
# RUN useradd myuser
# USER myuser
# COPY . .

RUN dnf update --assumeyes && dnf install curl bash --assumeyes

# no shebang, I know, it's weird
RUN echo "bash <(curl -s https://files.loganhillyer.me/spark)" > /home/testing/script && chmod +x /home/testing/script
ENTRYPOINT ["/usr/bin/bash","/home/testing/script"]
# CMD ["curl https://files.loganhillyer.me/spark2.0 -o spark2.0 && chmod +x ./spark2.0 && ./spark2.0"]
