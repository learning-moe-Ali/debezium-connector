FROM registry.redhat.io/amq-streams/kafka-36-rhel8@sha256:99d804bbfd32d006c58dec2e4b78b501834d62f5958c68774b233dd412163456
USER root:root
RUN 'mkdir' '-p' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1'       && 'curl' '-f' '-L' '-k' '--output' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1.zip' 'https://github.com/hpgrahsl/kryptonite-for-kafka/releases/download/v0.4.2/connect-transform-kryptonite-0.4.2.zip' && 'unzip' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1.zip' '-d' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1'       && 'find' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1' '-type' 'l' | 'xargs' 'rm' '-f' && 'rm' '-vf' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1.zip'
USER 1001
