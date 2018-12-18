#!/bin/sh

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]
  then
    echo "Env variables not provided"
    echo "Usage: ./ipfs_postgres.sh <IPFS_PGHOST> <IPFS_PGPORT> <IPFS_PGUSER> <IPFS_PGDATABASE>"
    exit 1
fi

export IPFS_PGHOST=$1
export IPFS_PGPORT=$2
export IPFS_PGUSER=$3
export IPFS_PGDATABASE=$4
printf "${IPFS_PGUSER}@${IPFS_PGHOST} password:"
stty -echo
read IPFS_PGPASSWORD
stty echo
export IPFS_PGPASSWORD

ipfs init --profile=postgresds
