`cd k8s-4-it-pros/day-1/lesson-04-pods`{{execute}}

## Create a pod with one container declaratively

`kubectl apply -f ./simplepod.yaml`{{execute}}

To view the manifest, type or click:

`cat ./simplepod.yaml`{{execute}}

To access the shell of the only container in the pod you just created, type or click:

`kubectl exec -it simplepod -- sh`{{execute}}

To exit the container's shell and go back to the machine prompt, type or click:

`exit`{{execute}}

## Create a pod with two containers declaratively

`kubectl apply -f ./complexpod.yaml`{{execute}}

To view the manifest, type or click:

`cat ./complexpod.yaml`{{execute}}

To access the `hpa-example` container, which is one of the two containers in the pod, type or click:

`kubectl exec -it complexpod  --container hpa-example -- sh`{{execute}}

To exit the container's shell and go back to the machine prompt, type or click:

`exit`{{execute}}