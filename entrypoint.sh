#!/bin/sh

# If a secret file exists, trim CR/LF and export as env var
if [ -f "/run/secrets/loki-token" ]; then
  LOKI_TOKEN="$(tr -d '\r\n' < /run/secrets/loki-token)"
  export LOKI_TOKEN
fi

# If args are provided, forward them (preserving argument boundaries) with exec.
if [ $# -eq 0 ]; then
  exec java -jar /app/app.jar
else
  exec "$@"
fi

