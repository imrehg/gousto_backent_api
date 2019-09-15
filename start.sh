#!/usr/bin/env bash

if [[ "$1" == "test" ]]; then
    echo "Running the tests only."
    pip install -r requirements_test.txt
    pytest -W ignore::DeprecationWarning
else
    echo "Starting up server"
    gunicorn --bind "0.0.0.0:${PORT=8000}" wsgi:app
fi