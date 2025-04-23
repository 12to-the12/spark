FROM ubuntu
WORKDIR /root
# RUN useradd myuser
# USER myuser
# COPY . .

RUN apt update -y && apt install curl --yes
# RUN echo "#!/bin/bash\ncurl https://files.loganhillyer.me/spark2.0 -o spark2.0 && chmod +x ./spark2.0 && ./spark2.0" > ./grab && chmod +x /root/grab
RUN echo "#!/bin/bash\nbash <(curl -s https://files.loganhillyer.me/spark)" > /root/script && chmod +x /root/script
# CMD ["grab"]
ENTRYPOINT ["/root/script"]
# CMD ["curl https://files.loganhillyer.me/spark2.0 -o spark2.0 && chmod +x ./spark2.0 && ./spark2.0"]
