FROM alpine

RUN apk add bash
COPY archiver.sh /app/
WORKDIR /app
RUN chmod +x archiver.sh
CMD [ "./archiver.sh" ]
