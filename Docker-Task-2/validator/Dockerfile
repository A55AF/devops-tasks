FROM alpine

RUN apk add bash
COPY validator.sh /app/
WORKDIR /app
RUN chmod +x validator.sh
CMD [ "./validator.sh" ]
