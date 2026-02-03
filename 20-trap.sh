#!/bin/bash

set -e

error(){

}

trap error ERR

echo "Hello"
echo "Before error.."
ggshjdagsj #here shell understands there is an error and signal is ERR
echo "After error.."