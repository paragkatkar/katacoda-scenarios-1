
**Time to complete step:** 3 Minutes

INTRODUCTORY TEXT TO BE PROVIDED

**First, let's create a deployment** that uses an nginx web server. We'll use the Kubernetes `kubectl run` command
to spin up a deployment of the nginx web server as well as a Kubernetes service that uses the pods in the deployment.

Execute the command below by clicking on it using your mouse.

`kubectl create nginx --image=nginx --requests=cpu=500m,memory=500M --expose --port=80`{{execute}}

Now, give Kubernetes about 10 seconds to create the deployment and service. Once 10 seconds has passed, execute this
command to make sure the nginx pod was created:

`kubectl get pods | grep nginx`{{execute}}

If all is well you will see that pod is `Running`, as shown in the following output:

```
nginx-59b864868f-6sqv2                    1/1       Running   0          5m
```

**WHERE**

`nginx-59b864868f-6sqv2` is the special name of the pod assigned by Kubernetes to the deployment. Remember, by default,
Kubernetes will special name the pod upon creation.

Next, execute this command to make sure the corresponding nginx service was created:

`kubectl get service | grep nginx`{{execute}}

Now, we need a way to access the nginx service so we can test the load 
capacity on the nginx pod(s).

Let's create a simple testing deployment that will allow us access into the cluster so that we can exercise
the ngnix default service. We'll create a deployment called, `deployment-for-testing` using the `kubectl run` command. And
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

`wget -q -O- http://nginx.default.svc.cluster.local`{{execute}}

If all is going according to plan, you should see the HTML for the nginx Welcome Page, like so:

```HTML
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```
Now we can access the service from inside the cluster. Let's exit the cluster for now. 

`exit`{{execute}} 

(**DEV NOTE**: There is a bug that when the `exit` command is clicked, it terminates the entire Katacoda sesssion. 
However, entering `exit` manually at the command line of the Katacoda terminal will exit the cluster, as expected.)

We'll get back to working directly with the cluster shortly, but before that time we need to
apply a Horizontal Pod Autoscaler to the the deployment.





