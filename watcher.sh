```bash
#!/bin/bash

# Define variables
namespace="your-namespace"
deployment="your-deployment"
max_restarts=3

while true; do
restarts=$(kubectl get pods -n $namespace | grep $deployment | awk '{print $4}')

echo "Current restart count: $restarts"

if [ $restarts -gt $max_restarts ]; then
echo "Restart count exceeded the limit. Scaling down deployment..."
kubectl scale deployment $deployment --replicas=0 -n $namespace
break
fi

sleep60
done
```
