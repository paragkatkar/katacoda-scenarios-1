`cd k8s-4-it-pros/day-1/lesson-04-pods`{{execute}}

## Create a pod with one container declaratively

`kubectl apply -f ./simplepod.yaml`{{execute}}

To view the manifest, type or click:

`cat ./simplepod.yaml`{{execute}}

Pod creation goes through a number of stages. First, Kubernetes needs to find a node where the pod and the containers
in the pod can be stored. Then, container manager takes over and gets the container images defined in the manifest file
from the container registry. (DockerHub is the default) Finally, the container will spin up to achieve a status of `running`.

To determine if the containers in a pod are running, type or click:

`kubectl get pods `{{execute}}

However, be advised sometimes a container will not be able to spin up for one of a variety of reasons. Then you will need to
troubleshoot. The first thing to do is to find out information about the pod and get a sense of how events unfolded. To this,
you'll use the ` kubectl describe` command. In this case, because we know the name of the pod is, `simplepod`, type or click:

`kubectl describe pod simplepod`{{execute}}

To access the shell of the only container in the pod you just created, `simplepod`, type or click:

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