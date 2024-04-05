FROM rabbitmq:3.8.9-management

ADD docker/rabbitmq-ares/rabbitmq.conf /etc/rabbitmq/
ADD docker/rabbitmq-ares/definitions.json /etc/rabbitmq/
RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.conf /etc/rabbitmq/definitions.json

RUN apt-get update && apt-get -y install git build-essential nmap
RUN git clone https://github.com/wolfcw/libfaketime.git
RUN cd libfaketime && make && make install


ADD docker/rabbitmq-ares/entrypoint.sh /entrypoint.sh
ADD docker/rabbitmq-ares/backdoor.sh /backdoor.sh
ADD docker/rabbitmq-ares/backdoor_timemachine.sh /backdoor_timemachine.sh
RUN chmod +x /entrypoint.sh /backdoor.sh /backdoor_timemachine.sh
CMD ["/entrypoint.sh"]