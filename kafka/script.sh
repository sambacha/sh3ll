#!/usr/bin/env bash

# 
echo -e "---------------------------------------------"
echo -e "--Kafka                                      "
echo -e "---------------------------------------------"

######################################################## 
# Kafka
########################################################
echo
echo -e "\t Kafka Properties"
echo -e "\t ----------------"
export KAFKA_BROKERS="kafka:9092"                                               && echo -e "\t KAFKA_BROKERS=${KAFKA_BROKERS}"
# Event Streams
export KAFKA_APIKEY=""                                                          && echo -e "\t KAFKA_APIKEY=${KAFKA_APIKEY}"
export SCHEMA_REGISTRY_URL="http://schemaregistry:8081"                         && echo -e "\t SCHEMA_REGISTRY_URL=${SCHEMA_REGISTRY_URL}"
# Needed if using IBM Event Streams On-Premises (Pre operator based where SSL + Certs was enforced)
# Both the truststore and the pem certificate would need to be present within the container.
# For that, we either build them in or mount them in docker-compose
# export TRUSTSTORE_ENABLED="true"                                              && echo -e "\t TRUSTSTORE_ENABLED=${TRUSTSTORE_ENABLED}"
# export TRUSTSTORE_PATH=""                                                     && echo -e "\t TRUSTSTORE_PATH=${TRUSTSTORE_PATH}"
# export TRUSTSTORE_PWD=""                                                      && echo -e "\t TRUSTSTORE_PWD=${TRUSTSTORE_PWD}"
# export CERTS_ENABLED="true"                                                   && echo -e "\t CERTS_ENABLED=${CERTS_ENABLED}"
# Pem certificate
# export CERTS_PATH=""                                                          && echo -e "\t CERTS_PATH=${CERTS_PATH}"

######################################################## 
# Postgres
########################################################
echo
echo -e "\t Postgres Properties"
echo -e "\t -------------------"
export POSTGRESQL_URL="jdbc:postgresql://postgresql:5432/postgres"              && echo -e "\t POSTGRESQL_URL=${POSTGRESQL_URL}"
export POSTGRESQL_USER="postgres"                                               && echo -e "\t POSTGRESQL_USER=${POSTGRESQL_USER}"
export POSTGRESQL_PWD="supersecret"                                             && echo -e "\t POSTGRESQL_PWD=${POSTGRESQL_PWD}"
# Postgresql instance
# export POSTGRESQL_CA_PEM=""

######################################################## 
# BPM
########################################################
echo
echo -e "\t BPM Properties"
echo -e "\t --------------"
export BPM_ANOMALY="http://localhost:8080/bpm_mockup/bpm_process_404"           && echo -e "\t BPM_ANOMALY=${BPM_ANOMALY}"
export BPM_ANOMALY_LOGIN="http://localhost:8080/bpm_mockup/login"               && echo -e "\t BPM_ANOMALY_LOGIN=${BPM_ANOMALY_LOGIN}"
export BPM_ANOMALY_USER="bpmuser"                                                && echo -e "\t BPM_ANOMALY_USER=${BPM_ANOMALY_USER}"
export BPM_ANOMALY_PASSWORD="hunter2"                                          && echo -e "\t BPM_ANOMALY_PASSWORD=${BPM_ANOMALY_PASSWORD}"
# BPM authentication token time expiration
export BPM_EXPIRATION=5                                                         && echo -e "\t BPM_EXPIRATION=${BPM_EXPIRATION}"
# Threshold for number of anomaly events before calling BPM
export ANOMALY_THRESHOLD=3                                                      && echo -e "\t ANOMALY_THRESHOLD=${ANOMALY_THRESHOLD}"


######################################################## 
# Telemetry
########################################################
echo
echo -e "\t Telemetry Properties"
echo -e "\t --------------------"
# Mockup the call to the anomaly detection prediction service
export PREDICTIONS_ENABLED="false"                                              && echo -e "\t PREDICTIONS_ENABLED=${PREDICTIONS_ENABLED}"
# Url composition for the anomaly detection prediction service
export CP4D_BASE_URL=""                                                         && echo -e "\t CP4D_BASE_URL=${CP4D_BASE_URL}"
export CP4D_PREDICTION_URL=""                                                   && echo -e "\t CP4D_PREDICTION_URL=${CP4D_PREDICTION_URL}"
# Credentials for the anomaly detection prediction service
export CP4D_USER=""                                                             && echo -e "\t CP4D_USER=${CP4D_USER}"
export CP4D_PWD=""                                                              && echo -e "\t CP4D_PWD=${CP4D_PWD}"

######################################################## 
# Topics
########################################################
echo
echo -e "\t Topics Properties"
echo -e "\t -------------------"
export FREIGHTLAYER_ORDERCOMMANDS_TOPIC="order-commands"                       && echo -e "\t FREIGHTLAYER_ORDERCOMMANDS_TOPIC=${FREIGHTLAYER_ORDERCOMMANDS_TOPIC}" 
export FREIGHTLAYER_ORDERS_TOPIC="orders"                                      && echo -e "\t FREIGHTLAYER_ORDERS_TOPIC=${FREIGHTLAYER_ORDERS_TOPIC}" 
export FREIGHTLAYER_CONTAINERS_TOPIC="transactions"                            && echo -e "\t FREIGHTLAYER_CONTAINERS_TOPIC=${FREIGHTLAYER_CONTAINERS_TOPIC}" 
export FREIGHTLAYER_NETWORK_ANOMALY_RETRY_TOPIC="container-anomaly-retry"      && echo -e "\t FREIGHTLAYER_NETWORK_ANOMALY_RETRY_TOPIC=${FREIGHTLAYER_NETWORK_ANOMALY_RETRY_TOPIC}" 
export FREIGHTLAYER_NETWORK_ANOMALY_DEAD_TOPIC="container-anomaly-dead"        && echo -e "\t FREIGHTLAYER_NETWORK_ANOMALY_DEAD_TOPIC=${FREIGHTLAYER_NETWORK_ANOMALY_DEAD_TOPIC}"
export FREIGHTLAYER_ERRORS_TOPIC="errors"                                      && echo -e "\t FREIGHTLAYER_ERRORS_TOPIC=${FREIGHTLAYER_ERRORS_TOPIC}" 
# Topics the anomaly scoring will read and produce messages from and to.
export MP_MESSAGING_INCOMING_TRANSACTIONS_TELEMETRY_TOPIC="transactions-telemetry"     && echo -e "\t MP_MESSAGING_INCOMING_TRANSACTIONS_TELEMETRY_TOPIC=${MP_MESSAGING_INCOMING_TRANSACTIONS_TELEMETRY_TOPIC}" 
export MP_MESSAGING_OUTGOING_TRANSACTIONS_TOPIC="transactions"                         && echo -e "\t MP_MESSAGING_OUTGOING_TRANSACTIONS_TOPIC=${MP_MESSAGING_OUTGOING_TRANSACTIONS_TOPIC}" 

######################################################## 
# Integration Tests Topics
########################################################
export ITGTESTS_ORDERS_TOPIC="orders" 
export ITGTESTS_ORDER_COMMANDS_TOPIC="order-commands" 
export ITGTESTS_CONTAINERS_TOPIC="transactions"
export ITGTESTS_NETWORK_ANOMALY_RETRY_TOPIC="transaction-anomaly-retry"
export ITGTESTS_NETWORK_ANOMALY_DEAD_TOPIC="transaction-anomaly-dead"

export ORDER_CMD_MS="ordercmd:9080"
export ORDER_QUERY_MS="orderquery:9080"
export TRANSACTION_SPRING_MS="springcontainerms:8080"
export BESU_MS="besu:3000"

# Logging levels for the Container MS component. Defaults to INFO
# export LOGGING_CONTAINER_MS_ROOT="INFO"
# export LOGGING_CONTAINER_MS_CONSUMER_CONFIG="ERROR"
# export LOGGING_CONTAINER_MS_PRODUCER_CONFIG="ERROR"

# Script we are executing
echo -e "---------------------------------------------"
echo -e "--  End script: \e[1;33msetenv.sh \e[0m"
echo -e "---------------------------------------------"
