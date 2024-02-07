FROM debezium-streams-connect:latest
RUN mkdir /opt/kafka/plugins/debezium-oracle-connector
RUN 'mkdir' '-p' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1'       && 'curl' '-f' '-L' '--output' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1.zip' 'https://github.com/hpgrahsl/kryptonite-for-kafka/releases/download/v0.4.2/connect-transform-kryptonite-0.4.2.zip' && 'unzip' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1.zip' '-d' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1'       && 'find' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1' '-type' 'l' | 'xargs' 'rm' '-f' && 'rm' '-vf' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1.zip'
