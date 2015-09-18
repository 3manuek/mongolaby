FROM docker/mongo:latest

# grab the shitty line from mongo site
# RUN apt-get -y update && apt-get install -y mongo
RUN apt-get -y update && apt-get install node

CMD docker run --name mongo \
-v /home/core/mongo/data:/data/db \
-v /home/core/mongo:/opt/keyfile \
--hostname="Emanuels-iMac.local" \
-p 27017:27017 \
-d mongo:2.6.5 --smallfiles

EXPOSE 27017


6e11a34c04b2f00bfb795c5248fec425fb64318e3596f2f313f92440706760ab
