
**This preview video shows you exactly what you're going to do in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/Mblcnh58qtE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Time to complete step:** 3 Minutes

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

**In order to perform all the activities required in this step you need to know how to work with the text editor, `vi` 
to add data to a text file.**

The way that the Horizontal Pod Autoscaler (HPA) works is that it monitors the utilization among all the pods relevant to
a particular deployment. If a pod's utilization starts to exceed it allocation, HPA will spin up a new pod, provided
that a node on the cluster has the space to accommodate an additional pod.

But, in order to work, there need to be a metrics controller installed that will report to HPA utilization activity on
the pods. In the case of this scenario, we need to install the metrics controller. The controller will use is [Kubernetes
Metric Server](https://github.com/kubernetes-incubator/metrics-server).

The installation process is a 3 step process.

* Get the metrics server code from GitHub
* Add a setting in the yaml manifest file, `deploy/1.8+/metrics-server-deployment.yaml` to allow the metrics server to
 work in the scenario interactive computing environment
* Apply the manifest files to the Kubernetes cluster running in the scenario to install the metric server
* Verify the metrics server is running
The details are as follows.

## Get the metrics server code from GitHub

`
git clone https://github.com/kubernetes-incubator/metrics-server.git
`{{execute}}

## Add a setting in the yaml manifest file

After you've cloned the metrics server code from GitHub, to the metrics server directory, like so

`
cd metrics-server/
`{{execute}}

We need to add some information to the manifest yaml file, `deploy/1.8+/metrics-server-deployment.yam` in order to have
Metric Server work properly in this interactive learning environment. We're going to open the yaml file in the terminal
window using the `vi` text editor. Then, we're going to make the necessary addition and finally save the file.

Open the yaml file, `deploy/1.8+/metrics-server-deployment.yaml` in `vi` using the following command:

`
vi deploy/1.8+/metrics-server-deployment.yaml
`{{execute}}


You should see this within the yaml file:

```
  containers:
  - name: metrics-server
    image: k8s.gcr.io/metrics-server-amd64:v0.3.1
    imagePullPolicy: Always
    volumeMounts:
    - name: tmp-dir
      mountPath: /tmp
```

Put the vi editor in to insert mode and add the text within the comments below:
```
  containers:
  - name: metrics-server
    image: k8s.gcr.io/metrics-server-amd64:v0.3.1
    imagePullPolicy: Always
    #add text starting here...
    command:
    - /metrics-server
    - --metric-resolution=30s
    - --kubelet-insecure-tls
    - --kubelet-preferred-address-types=InternalIP
    #... ending here
    volumeMounts:
    - name: tmp-dir
      mountPath: /tmp
```

Save the contents of the yaml file.

## Apply the manifest files

Now we need to actually install the metrics server. Execute the command below.

`kubectl apply -f deploy/1.8+/`{{execute}}


## Verify the metrics server is running

Execute this `kubectl` command to verify the metrics server is installed

`kubectl get po -n kube-system |grep metrics`{{execute}}

Wait 60 seconds for the metrics server to warm up, then type this command to ensure the the metrics server is working:

`kubectl top pod --all-namespaces`{{execute}}

You should get some metrics info, similar to, but not exactly like this:

```
kube-system   coredns-78fcdf6894-n48vg          2m           10Mi
kube-system   coredns-78fcdf6894-rkbgg          2m           9Mi
kube-system   etcd-master                       14m          85Mi
kube-system   kube-apiserver-master             27m          407Mi
kube-system   kube-controller-manager-master    21m          59Mi
kube-system   kube-proxy-bq9hs                  2m           19Mi
kube-system   kube-proxy-c7qnk                  2m           17Mi
kube-system   kube-scheduler-master             7m           14Mi
kube-system   metrics-server-7dfcc96bd9-txz92   2m           14Mi
kube-system   weave-net-5x6ns                   1m           57Mi
kube-system   weave-net-b9cm6                   1m           52Mi
```

The next step is to install an application that we'll use to burden CPU utilization and which HPA will remedy.
