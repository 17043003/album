#!/usr/bin/env bash
rm -f /usr/src/api/tmp/pids/server.pid
rails server -b '0.0.0.0'