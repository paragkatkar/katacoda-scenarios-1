INTRODUCTORY TEXT TO BE PROVIDED

**First, let's create a deployment** that uses an nginx web server. We'll use the Kubernetes `kubectl run` command
to spin up deployment of the nginx web server as well as Kubernetes service to expose the pods in the deployment.

Execute the command below by clicking on it using your mouse.

`kubectl run nginx --image=nginx --requests=cpu=500m,memory=500M --expose --port=80`{{execute}}

Now, Kubernetes about 10 seconds to create the deployment and service. Once 10 seconds has passed, execute this
command to make sure the nginx pod was created:

`master $ kubectl get pods | grep nginx`{{execute}}

Then execute this command to make sure the corresponding nginx service was created:

`master $ kubectl get service | grep nginx`{{execute}}

Next, we need to to **expose the service** to the outside world so that we can test the load 
capacity on the pods.

`kubectl run -i --tty service-for-testing --image=nginx /bin/sh`{{execute}}

Now you are in the cluster. Let's see if we can access the nginx service using the testing service.

`wget -q -O- http://service-for-testing.default.svc.cluster.local`{{execute}}

`COMMAND TO BE PROVIDED`

Execute this command to verify that we can indeed access the service:

`COMMAND TO BE PROVIDED`

If everything is in order, **next we need to max out the capacity of the nginx server**
running on the pod. Once we max out the pod, we'll apply the Kubernetes Horizontal Pod Autoscaler.
K8S HPA will create just the righ number of pods required to reduce the request burden.

We'll cover this entire process in the next step.


