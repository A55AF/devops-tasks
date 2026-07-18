FROM alpine

RUN apk add bash
COPY generator.sh /app/
WORKDIR /app
RUN chmod +x generator.sh
CMD [ "./generator.sh" ]
