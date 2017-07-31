FROM python:3

RUN pip install devpi-server devpi-web devpi-lockdown && devpi-server --init
EXPOSE 3141

ENTRYPOINT ["devpi-server"]
