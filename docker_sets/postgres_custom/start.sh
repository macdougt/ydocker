#!/usr/bin/env bash
/docker-entrypoint.sh postgres &

sleep 10 # Wait for db to settle
echo "Done waiting"

DATABASE="world"

if psql -h localhost -U postgres -lqt | grep -qw $DATABASE; then
  echo "The database $DATABASE exists"
else
  echo "The database $DATABASE does not exist"
  echo "Creating base db and loading it with ${DATABASE}.sql";
  runuser -l postgres -c 'createdb world && psql world < /tmp/world.sql';
fi

sleep infinity
