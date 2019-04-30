**Navigate to** the lesson directory

`cd k8s-4-it-pros/day-1/lesson-04-pods`{{execute}}

**Clear the screen** in order to get an uncluttered workspace

`clear`{{execute}}

There are two ways to create API Resource objects in Kubernetes, ***imperatively*** and ***declaratively***.

## Create a pod with one container imperatively

Imperative creation is done by issuing a command at the command line. For example the following command will
create a pod with the name, `pinger` with a single container:

`kubectl run --generator=run-pod/v1 pinger-dk --image=reselbob/pinger:v2.1`{{execute}}

## Create a pod with one container declaratively

Declarative creation is done using a manfiest file. A manifest file describes the resource to create. A manifest file
can be in YAML or JSON format. You create a resource declaratively using the command `kubectl apply -f  MANIFEST_FILE`, **WHERE**
`MANIFEST_FILE` is the path the manifest file. The following command will create a pod based on the settings it the manifest
file, `simplepod.yaml`. Type or click:

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

Run a command in the shell

`printenv`{{execute}}

To exit the container's shell and go back to the machine prompt, type or click:

`exit`{{execute}}

## Create a pod with two containers declaratively

`kubectl apply -f ./complexpod.yaml`{{execute}}

To view the manifest, type or click:

`cat ./complexpod.yaml`{{execute}}

To access the `pinger` container, which is one of the two containers in the pod, type or click:

`kubectl exec -it complexpod  --container pinger -- sh`{{execute}}

Run a command in the shell

`wget -q -O- localhost:3000`{{execute}}

To exit the container's shell and go back to the machine prompt, type or click:

`exit`{{execute}}