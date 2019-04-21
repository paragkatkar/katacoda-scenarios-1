**This preview video shows you exactly what you're going to do in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/ItaU24OsLKk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


------

**IMPORTANT**: You need to have done tasks described previously in Step 3 in order for all the concepts and instructions
in this step to make sense and work. If you have not done Step 3, please go back!

------

**Time to complete step:** 4 Minutes

In the last step we created a testing container that has code that keeps calling the service, `hpa-demo-web`, thus causing
the underlying pod to push the limits of CPU capacity.

In this step we're going to use HPA to alleviate the burden the single pod is creating. We'll apply HPA
to the deployment, `hpa-demo-web`. Then, in the following step we'll take a look at the results.

First, go back to the original terminal pane and look at how many instance of the pod, `hpa-demo-web` are running.

Click the following command to go back to the first terminal window and get a list of the `hpa-demo-web` running in Kubernetes:

`kubectl get pods | grep hpa-demo-web`{{execute T1}}

You should see output that shows a pod with the prefix `grep hpa-demo-web` on its name, like so:

`hpa-demo-web-5c4b4789bf-z9pfd             1/1       Running   0          5m`

Next, let used ask the metrics server for a list of the top running pods using the `kubectl top` command.

Click the following command to get a list of pods according to CPU utilization.

`kubectl top pods --all-namespaces`{{execute T1}}

You'll probably see output in which the pod `hpa-demo-web` is high on the list, similar to what is shown below:

```
NAMESPACE     NAME                                      CPU(cores)   MEMORY(bytes)
default       deployment-for-testing-5cf785f6d7-vgfd4   10m          2Mi
default       hpa-demo-web-5c4b4789bf-z9pfd             972m         10Mi
kube-system   coredns-78fcdf6894-cnztf                  4m           9Mi
kube-system   coredns-78fcdf6894-q2rn8                  4m           9Mi
kube-system   etcd-master                               14m          73Mi
kube-system   kube-apiserver-master                     33m          402Mi
kube-system   kube-controller-manager-master            22m          60Mi
kube-system   kube-proxy-27dfz                          2m           19Mi
kube-system   kube-proxy-75jl8                          2m           18Mi
kube-system   kube-scheduler-master                     7m           14Mi
kube-system   metrics-server-7dfcc96bd9-fnk2x           1m           15Mi
kube-system   weave-net-7rl6h                           1m           55Mi
kube-system   weave-net-7sqq6                           1m           55Mi
```

Now we need to apply HPA to alleviate the burden.

Click the following command to create an HPA against the deployment, `hpa-demo-web`.

`kubectl autoscale deployment hpa-demo-web --cpu-percent=5 --min=1 --max=5`{{execute T1}}

The HPA will keep an eye on the pods that are backing the `hpa-demo-web` deployment. We set the `--cpu-pecentage` option
on the `kubectrl autoscale` command to a CPU threshold of 5%. Also, we told HPA to have a minimum of 1 pod running
(`--min=1`), but no more than 5 pods (`--max=5`).

Let's give HPA 60 seconds to get applied to the deployment.

Now, let's take a look at the status of the recently created HPA. 

Click the following command to view the status of the HPA.

`kubectl get hpa`{{execute T1}}

Initially, you're probably going to see output that looks something like this:

```
NAME           REFERENCE                 TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
hpa-demo-web   Deployment/hpa-demo-web   486%/5%   1         5         1          44s
```

Notice that the single pod deploymjent in the output above has a `TARGETS` that are running `486%/5%`. This means that
any pod, in this case the single one, is only permitted to run at `5%`, but that is when all the pods are added it, (in this case
the only single pod) it is running almost `500%` higher. In this case, 5 x 5%, which is 25% of CPU capacity. According to the
HPA configuration, more pods are needed.

Also, you'll notice that in the output above only pod (`REPLICAS 1``) is running. This because it takes HPA a while to notice
that help is needed. HPA polls the metrics server at a default value of 15 seconds in order to figure out if help is needed. When
we take another look at HPA 8 minutes later, we get output that looks similar to this:

```
NAME           REFERENCE                 TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
hpa-demo-web   Deployment/hpa-demo-web   99%/5%    1         5         5          8m

```

Let's move onto the next step and observe HPA in action in real time.



