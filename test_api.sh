#!/bin/bash
# test_api.sh
# Simple API test for Codebase Genius backend

if [ -z "$1" ]; then
  echo "Usage: ./test_api.sh <github_repo_url>"
  exit 1
fi

REPO_URL=$1

curl -X POST http://localhost:8000/run \
  -H "Content-Type: application/json" \
  -d "{\"repo_url\": \"$REPO_URL\"}"
