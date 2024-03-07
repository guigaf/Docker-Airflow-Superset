#!/bin/bash
# wait-for-it.sh
# Script que aguarda até que um determinado host/porta esteja disponível.

set -e

host="$1"
port="$2"
timeout="${3:-60}"

until nc -z -w5 "$host" "$port"; do
  echo "Aguardando que $host:$port esteja disponível..."
  sleep 1
  timeout=$((timeout-1))
  if [ "$timeout" -eq 0 ]; then
    echo "Tempo limite atingido. Falha ao esperar por $host:$port."
    exit 1
  fi
done

echo "$host:$port está disponível!"