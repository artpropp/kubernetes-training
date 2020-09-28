#!/bin/bash

# Start service with message queue for work
kubectl apply -f work-queue.yaml


# Create a work queue called 'keygen'
QUEUE_HOST=bandicoot.example.com
curl -X PUT ${QUEUE_HOST}/memq/server/queues/keygen

# Create 100 work items and load up the queue
for i in work-item-{0..99}; do
  curl -X POST ${QUEUE_HOST}/memq/server/queues/keygen/enqueue \
    -d "${i}"
done

# Fetch stats
curl ${QUEUE_HOST}/memq/server/stats

# Start consumers
kubectl apply -f job-consumers.yaml

# Clean up
# kubectl delete -f work-queue.yaml
# kubectl delete -f job-consumers.yaml
