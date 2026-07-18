FROM alpine

RUN apk add bash
COPY statistics.sh /app/
WORKDIR /app
RUN chmod +x statistics.sh
CMD [ "./statistics.sh" ]
