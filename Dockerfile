FROM python:alpine3.9


# RUN apk add chromium-chromedriver
RUN apk update && \
	apk add python chromium py-pip curl unzip libexif udev xvfb && \
    wget -q https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip -O /tmp/chromedriver_linux64.zip \
    && unzip -qq /tmp/chromedriver_linux64.zip -d /usr/local/bin \
    && rm /tmp/chromedriver_linux64.zip \
    && chmod +x /usr/local/bin/chromedriver && \ 
    export PATH=$PATH:/usr/local/bin && \
    pip install robotframework  robotframework-seleniumlibrary selenium
WORKDIR /test

COPY ./test ./

CMD ["robot","."]