FROM node:14
ENV TZ 'Asia/Seoul'
RUN echo $TZ > /etc/timezone && \ 
    apt-get update && apt-get install -y tzdata && \
    apt-get install -y vim && \
    rm /etc/localtime && \ 
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \ 
    dpkg-reconfigure -f noninteractive tzdata && \ 
    apt-get clean

RUN mkdir -p /ytdlbot/download
RUN mkdir -p /ytdlbot/db

WORKDIR /ytdlbot

COPY . .

RUN npm i

RUN chmod +x /ytdlbot/entry-point.sh

CMD ["/ytdlbot/entry-point.sh"]
