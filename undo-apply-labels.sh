#!/bin/bash

 kubectl delete pods alpaca-prod &
 kubectl delete pods alpaca-test &
 kubectl delete pods bandicoot-prod &
 kubectl delete pods bandicoot-staging &
