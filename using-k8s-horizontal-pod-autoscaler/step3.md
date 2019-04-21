
**Time to complete step:** 3 Minutes

INTRODUCTORY TEXT TO BE PROVIDED

**First, let's create a deployment** that uses a web application that does nothing more than return a `OK` response.

We'll use the Kubernetes `kubectl run` command to spin up a deployment.

`kubectl run hpa-demo-web --image=k8s.gcr.io/hpa-example --requests=cpu=200m --port=80`{{execute}}

The command shown above will get the web application container image from Google Cloud.

Let's make sure the pod is running by executing the following command:

`kubectl get pod | grep hpa-demo-web`{{execute}}

You should see something like this:

Next, let's start a service that uses the deployment:

`kubectl expose deployment hpa-demo-web --type=NodePort`{{execute}}

Let's check the service is running:

`kubectl get service | grep hpa-demo-web`{{execute}}


We need to create a simple testing deployment that will allow us access into the cluster so that we can exercise
the service, `hpa-demo-web`. We'll create a deployment called, `deployment-for-testing` using the `kubectl create` command. And
as part of the imperative execution from the command line, we'll use the option `-it` to login directly
to the pod running under the deployment.

(In this case, the testing deployment will create a pod with a [busybox](https://hub.docker.com/_/busybox) container.)

Execute this command, either by typing it out at the command line of the Katacoda interactive learning
environment, or just click on the command using your mouse.

`kubectl run -it deployment-for-testing --image=busybox /bin/sh`{{execute}}

It might take a few seconds, but you should see the command prompt, `/ #`. This prompt indicates
that you are indeed in the Kubernetes cluster. (You might see a message, `If you don't see a command prompt,
try pressing enter.`
If you do, strike the `enter` key.)

Now you are in the cluster. Let's see if we can access the nginx service using the testing service.

Execute this command to verify that we can indeed access the nginx service:

`wget -q -O- http://hpa-demo-web.default.svc.cluster.local`{{execute}}

If all is going according to plan, you should see the HTML for the nginx Welcome Page, like so:

```
OK!
```
Now we can access the service from inside the cluster. Let's exit the cluster for now. 

`exit`{{execute}} 

(**DEV NOTE**: There is a bug that when the `exit` command is clicked, it terminates the entire Katacoda sesssion. 
However, entering `exit` manually at the command line of the Katacoda terminal will exit the cluster, as expected.)

We'll get back to working directly with the cluster shortly, but now we need to
apply a Horizontal Pod Autoscaler to the the deployment.





