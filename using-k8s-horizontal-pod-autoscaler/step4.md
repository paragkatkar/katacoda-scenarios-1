**Time to complete step:** 3 Minutes

------

**IMPORTANT**: You need to have done tasks described previously in Step 3 in order for all the concepts and instructions
in this step to make sense and work. If you have not done Step 3, please go back!

------

In the last step we created a testing container that has code that keeps calling the service, `hpa-demo-web`, thus causing
underly pod to push the limits of CPU capacity.

In this step we're going to use HPA to accommodate alleviate the burden the single pod is creating. We'll apply HPA
to the deployment, `hpa-demo-web`. Then, in the following step we'll take a look at the results.

Let's open the second terminal window titled, and imperatively create an HPA for the deployment, `hpa-demo-web` using the `kubectrl autoscale`
command. 

Let's go back to the original terminal window and take look at a few things.

First, let's look at how many instance of the pod, `hpa-demo-web` are running. Click the following command to go back to the
first terminal window and get a list of the `hpa-demo-web` running in Kubernetes:

`kubectl get pods | grep hpa-demo-web`{{execute T1}

Next, let used ask the metrics server for a list of the top running pods using the `kubectl top` command.

Click the following command to go back a list of pods according to CPU utilization.

`kubectl top pods --all-namespaces`{{execute T1}


Click the following command to create an HPA against the deployment, `hpa-demo-web`.

`kubectl autoscale deployment hpa-demo-web --cpu-percent=5 --min=1 --max=5`{{execute T1}}

The HPA will keep an eye on the pods that are backing the `hpa-demo-web` deployment. We'll set the `--cpu-pecentage` option
on the `kubectrl autoscale` command to a CPU threshold of 5%. Also, we'll tell the HPA to have a mininum of 1 pod running
(`--min=1`), but no more than 5 pods (`--max=5`).

Let's give HPA 60 seconds to get applied to the deployment.

Now, let's take a look at the status of the recently created HPA. 

Click the following command to view the status of the HPA.

`kubectl get hpa`{{execute T1}}

`[Show output]`

OK, so the HPA is up and running. The next step is to observe that HPA has indeed created new pods to accomodate the overload
the the deployment is placing on CPU utilization.






