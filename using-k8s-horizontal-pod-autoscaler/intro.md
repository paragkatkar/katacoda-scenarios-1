
 * **Educational Objective**
 * **What To Expect**
 * **What You Need To Know Before You Start**
 * **Understanding why Kubernetes Horizontal Pod Autoscaler is important**
 * **Scenario Contents**
 
 
<a name="eductional-objective"></a>
## Educational Objective

The purpose of this scenario is to help the learner understand the nature and use
of [Kubneretes Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/), which is also known by the
shorthard term, `K8S HPA`.
<a name="what-to-expect"></a>
## What To Expect

After taking this scenario you will:

* Understand how to use the  Katacoda interactive learning environment to understand key concepts
and master hands on techniqures required to work with K8S HPA.
* Understand how K8S HPA ensures that your application or service always has the number of pods necessary
to operate at the best efficiency possible.
* Be able to create a simple autoscaling deployment using K8S HPA [imperatively](https://kubernetes.io/docs/concepts/overview/object-management-kubectl/imperative-command/) at the command line.
* Be able to view the state of your deployment running under K8S HPA using standard `kubectl` commands.
* Impose overwhelming load on a pod and then witness K8S HPA reduce load burden by adding more pods to your Kubernetes cluster

<a name="what-you-need"></a>
## What You Need To Know Before You Start

In order to get full benefit from this scenario, we expect that you have some introductory familiarity
with Kubernetes. You need to have a working knowledge of [clusters](https://kubernetes.io/docs/concepts/cluster-administration/cluster-administration-overview/), [pods](https://kubernetes.io/docs/concepts/workloads/pods/pod-overview/),
[deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) and [services](https://kubernetes.io/docs/concepts/services-networking/service/). Also, you should be
comfortable working with the command, [`kubectl`](https://kubernetes.io/docs/reference/kubectl/overview/).

We'll show you exactly the commands you will be using, but having a conceptual understanding of the commands and
objects you're working with will help you learn in a more meaningful way, well beyond simple rote entry of
commands in a terminal window.

<a name="understanding-hpa"></a>
## Understanding why Kubernetes Horizontal Pod Autoscaler is important.

Kubernetes Horizontal Pod Autoscaler (HPA) addresses a basic problem in distributed, container based architecture: scaling the
computing environment up or down to meet load demand. When you apply HPA to a Kubernetes deployment or replicaset, intelligence
in HPA will keep an eye on the CPU utilization of the pods in force. When a particular pod starts to approach a usage
threshold, HPA will create additional pods to alleviate the load burden of the pod(s) that is reaching the utilization limit.

The autoscaling capabilities of Kubernetes Horizontal Pod Autoscaler safeguard pods against runtime performance degradation
due to capacity overloads.

**However, please be advised** that HPA will only create pods in existing nodes of a cluster. It does not have the capability
to create new nodes when the cluster becomes overloaded. To apply node autoscaling to the cluster, you need to use
a tool such as [Cluster Autoscaler](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#what-is-cluster-autoscaler).
## Scenario Contents

**Step 1: Installing the Kubernetes Metric Serve**

In this step we'll install the metrics server that Kubernetes uses to get utilization information required by the 
Horizontal Pod Autoscaler.

**Step 2: Examining Your Kubernetes Cluster**

TO BE PROVIDED <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="40" alt="under construction" />

**Step 3: Creating an Autoscaling Deployment under K8S HPA**

TO BE PROVIDED <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="40" alt="under construction" />

**Step 4: Viewing Your Deployment Running Under K8S HPA**

TO BE PROVIDED <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="40" alt="under construction" />

**Step 5: Putting K8S HPA to the Test**

TO BE PROVIDED <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="40" alt="under construction" />

**Step 6: Viewing K8S HPA in Action**

TO BE PROVIDED <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="40" alt="under construction" />

**Step 7: Review**

TO BE PROVIDED <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="40" alt="under construction" />

**Step 8: Next Steps**

TO BE PROVIDED <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="40" alt="under construction" />