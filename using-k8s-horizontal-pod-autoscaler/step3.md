
**Time to complete step:** 3 Minutes

Is the last step we created the the web service application and go it up and running in a single pod in the
Kubernetes cluster, we'll create


In this step we'll create a simple test container that we'll use to access the Kubernetes service, `hpa-demo-web` from
within the cluster. We'll set up continuously running loop in the test container that keeps calling the
service, `hpa-demo-web`. Continuously calling the `hpa-demo-web` will stress out the underlying container. Later we'll
apply HPA to alleviate the stress. HPA will create more instances of the pod, `hpa-demo-web`.



In order to create the testing container, we'll create a deployment called, `deployment-for-testing` using the `kubectl create`
command. And as part of the imperative execution from the command line, we'll use the option `-it` to login directly
to the pod running under the deployment.

Creating the test container will be done in a new terminal window in the interactive learning environment.,

(In this case, the testing deployment will create a pod with a [busybox](https://hub.docker.com/_/busybox) container.)

Click the following command to create the test container deployment in a new terminal window.

`kubectl run -it deployment-for-testing --image=busybox /bin/sh`{{execute  T2}}

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

Now that you are in the test container, let's create a little looping program in bash and save it to the file, `loops.sh`.


Click the following command to create bash file that will container the looping program.

`echo "while true; do wget -q -O- http://hpa-demo-web.default.svc.cluster.local ; done" > loops.sh`{{execute T2}}

We need to give it execute permissions. Click on the following command:

`chmod +x /loops.sh`{{execute T2}}

Now let's burden on the pod, `hpa-demo-web` by running the bash script. 

`sh /loops.sh`{{execute}}

The instructions in the script will keep calling the pod, `hpa-demo-web`. You should see output in the terminal window similar
to the following:
```
OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!
OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!
OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!
OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!
OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!
OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!OK!
``` 

We're at the point now where the pod should be maxing out the CPU of the node in which it's running. In the next step we're
going to take look at the how the pod is faring without HPA. Then will apply HPA and see some new pods spin up.





