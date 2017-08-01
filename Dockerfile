FROM python:3

ADD run.sh /
RUN pip install devpi-client devpi-server devpi-web devpi-lockdown
EXPOSE 3141

ENTRYPOINT ["/run.sh"]
