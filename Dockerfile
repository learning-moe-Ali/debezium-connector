FROM registry.redhat.io/amq-streams/kafka-36-rhel8@sha256:99d804bbfd32d006c58dec2e4b78b501834d62f5958c68774b233dd412163456

USER root:root

ARG http_proxy=http://BarakaWSG.eg.albaraka.local:8080
ARG https_proxy=http://BarakaWSG.eg.albaraka.local:8080
ARG no_proxy=.cluster.local,.eg.albaraka.local,.svc,10.0.0.0/8,100.90.0.0/16,100.91.0.0/16,127.0.0.1,172.16.0.0/12,172.16.104.0/24,172.18.100.0/24,192.168.0.0/16,api-int.ocp-pdnpr01.eg.albaraka.local,localhost

      ##########
      # Connector plugin debezium-oracle-connector
      ##########
RUN 'mkdir' '-p' '/opt/kafka/plugins/debezium-oracle-connector/2381c496' \
      && 'curl' '-f' '-L' '--output' '/opt/kafka/plugins/debezium-oracle-connector/2381c496.zip' 'https://maven.repository.redhat.com/ga/io/debezium/debezium-connector-mysql/2.3.7.Final-redhat-00001/debezium-connector-mysql-2.3.7.Final-redhat-00001-plugin.zip' \
      && 'unzip' '/opt/kafka/plugins/debezium-oracle-connector/2381c496.zip' '-d' '/opt/kafka/plugins/debezium-oracle-connector/2381c496' \
      && 'find' '/opt/kafka/plugins/debezium-oracle-connector/2381c496' '-type' 'l' | 'xargs' 'rm' '-f' \
      && 'rm' '-vf' '/opt/kafka/plugins/debezium-oracle-connector/2381c496.zip'

RUN 'mkdir' '-p' '/opt/kafka/plugins/debezium-oracle-connector/2381c495' \
      && 'curl' '-f' '-L' '--output' '/opt/kafka/plugins/debezium-oracle-connector/2381c495.zip' 'https://maven.repository.redhat.com/ga/io/debezium/debezium-connector-oracle/2.3.7.Final-redhat-00001/debezium-connector-oracle-2.3.7.Final-redhat-00001-plugin.zip' \
      && 'unzip' '/opt/kafka/plugins/debezium-oracle-connector/2381c495.zip' '-d' '/opt/kafka/plugins/debezium-oracle-connector/2381c495' \
      && 'find' '/opt/kafka/plugins/debezium-oracle-connector/2381c495' '-type' 'l' | 'xargs' 'rm' '-f' \
      && 'rm' '-vf' '/opt/kafka/plugins/debezium-oracle-connector/2381c495.zip'
      
RUN 'mkdir' '-p' '/opt/kafka/plugins/debezium-oracle-connector/13037ebb' \
      && 'curl' '-f' '-L' '--output' '/opt/kafka/plugins/debezium-oracle-connector/13037ebb.zip' 'https://maven.repository.redhat.com/ga/io/debezium/debezium-scripting/2.3.4.Final-redhat-00001/debezium-scripting-2.3.4.Final-redhat-00001.zip' \
      && 'unzip' '/opt/kafka/plugins/debezium-oracle-connector/13037ebb.zip' '-d' '/opt/kafka/plugins/debezium-oracle-connector/13037ebb' \
      && 'find' '/opt/kafka/plugins/debezium-oracle-connector/13037ebb' '-type' 'l' | 'xargs' 'rm' '-f' \
      && 'rm' '-vf' '/opt/kafka/plugins/debezium-oracle-connector/13037ebb.zip'

RUN 'mkdir' '-p' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696e' \
      && 'curl' '-f' '-L' '--output' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696e.zip' 'https://maven.repository.redhat.com/ga/io/apicurio/apicurio-registry-distro-connect-converter/2.5.5.Final-redhat-00001/apicurio-registry-distro-connect-converter-2.5.5.Final-redhat-00001.zip' \
      && 'unzip' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696e.zip' '-d' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696e' \
      && 'find' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696e' '-type' 'l' | 'xargs' 'rm' '-f' \
      && 'rm' '-vf' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696e.zip'

RUN 'mkdir' '-p' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696f' \
      && 'curl' '-f' '-L' '-k' '--output' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696f.zip' 'https://github.com/hpgrahsl/kryptonite-for-kafka/releases/download/v0.4.2/connect-transform-kryptonite-0.4.2.zip' \
      && 'unzip' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696f.zip' '-d' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696e' \
      && 'find' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696f' '-type' 'l' | 'xargs' 'rm' '-f' \
      && 'rm' '-vf' '/opt/kafka/plugins/debezium-oracle-connector/aa0c696f.zip'

# RUN 'mkdir' '-p' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1' \
#       && 'curl' '-f' '-L' '-k' '--output' '/opt/kafka/plugins/debezium-oracle-connector/a615fea1.jar' 'https://raw.githubusercontent.com/hpgrahsl/rhd-csflc-kafka-connect-demos/main/use_case_1/connectors/smt/connect-transform-kryptonite-0.2.0.jar' 


RUN 'mkdir' '-p' '/opt/kafka/plugins/debezium-oracle-connector/7c46752d' \
      && 'curl' '-f' '-L' '--output' '/opt/kafka/plugins/debezium-oracle-connector/7c46752d/7c46752d.jar' 'https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc8/19.21.0.0/ojdbc8-19.21.0.0.jar'


RUN export JAVA_TOOL_OPTIONS="--add-opens=java.base/java.util=ALL-UNNAMED"

USER 1001
