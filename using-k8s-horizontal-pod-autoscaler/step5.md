<img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="80" alt="under construction" />

**Time to complete step:** 2 Minutes

------

**IMPORTANT**: You need to have done tasks described previously in Step 4 in order for all the concepts and instructions
in this step to make sense and work. If you have not done Step 4, please go back!

------

In this step we're going to take a look how Kubernetes uses the Horizonal Pod Autoscaler to accommodate increased
loads placed on the pods in a deployment.

Let's open the second terminal window titled, and imperatively create an HPA for the deployment, `hpa-demo-web` using the `kubectrl autoscale`
command. 

To open a second terminal window, click the `+ ` sign at the top of the Katacoda's interative terminal to the right.

Execute the following command to create an HPA against the deployemnt, `nginx`.

`kubectl autoscale deployment hpa-demo-web --cpu-percent=5 --min=1 --max=5`{{execute}}

The HPA will keep an eye on the pods that are backing the nginx service. We'll set the `--cpu-pecentage` option
on the `kubectrl autoscale` command to a threshold of 5%. Also, we'll tell the HPA to have a mininum of 1 pod running
(`--min=1`), but no more than 5 pods (`--max=5`).

Let's wait 45 seconds for HPA to ingratiate itself into Kubernetes cluster. Then execute the following command:

`kubectl get hpa`{{execute}} 

As you can see, the HPA is running and we're getting back useful information.

**In the next step we'll take a more in-depth view the behavior of the HPA.**

