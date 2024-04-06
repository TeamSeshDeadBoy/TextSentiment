# Base pytorch/torchserve image from docker.hub (leightweight)
FROM pytorch/torchserve:latest

# Creating our workdir + moving necessary files
COPY . /app
WORKDIR /app

# Elevated priviliges
USER root

# install dependencies
RUN --mount=type=cache,target=/root/.cache \
    pip3 install transformers

# Elevated properites for run.sh script
RUN chmod a+x run.sh


# Windows puts \r charaters on every new line, breaks the script! Fix:
RUN apt update
RUN apt install dos2unix
RUN dos2unix run.sh

# Download models
RUN bash run.sh

# run Torchserve to serve our sentiment analysis model
CMD ["torchserve", \ 
     "--start",  \
     "--models my_model=BERTweetSentimentAnalysis.mar", \
     "--ts-config /home/model-server/config.properties"] 