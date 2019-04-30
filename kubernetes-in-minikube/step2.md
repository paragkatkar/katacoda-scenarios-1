 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />
 
**Step 1:** Clear the screen to  get an uncluttered view.
 
`clear`{{execute}}
  
**Step 2:** Confirm that `kubectl` and `minikube` are up and running

What a minute or two. It takes a bit of time for minikube to get up and running in the interactive learning environment.

`kubectl version`{{execute}}

You should see something like this:

```yaml
Client Version: version.Info{Major:"1", Minor:"13", GitVersion:"v1.13.3", GitCommit:"721bfa751924da8d1680787490c54b9179b1fed0", GitTreeState:"clean", BuildDate:"2019-02-01T20:08:12Z", GoVersion:"go1.11.5", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"13", GitVersion:"v1.13.3", GitCommit:"721bfa751924da8d1680787490c54b9179b1fed0", GitTreeState:"clean", BuildDate:"2019-02-01T20:00:57Z", GoVersion:"go1.11.5", Compiler:"gc", Platform:"linux/amd64"}
```

Get some general information about the current cluster

`kubectl cluster-info`{{execute}}


**Example Output**

```bash
Kubernetes master is running at https://172.17.0.74:8443
KubeDNS is running at https://172.17.0.74:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

## Clusters and Contexts in Kubernetes

A `context` binds together a `user` and a `cluster`. For example, on this machine there is a `cluster` named `minikube` and 
a `user` named `minikube`. The context, `minikube` bind both together. 

To view the configuration file that describes the clusters and context to which this machine can access
by executing the following `kubectl` command:

`kubectl config view`{{execute}}

**Example Output**

```yaml
apiVersion: v1
clusters:
- cluster:
    certificate-authority: /root/.minikube/ca.crt
    server: https://172.17.0.74:8443
  name: minikube
contexts:
- context:
    cluster: minikube
    user: minikube
  name: minikube
current-context: minikube
kind: Config
preferences: {}
users:
- name: minikube
  user:
    client-certificate: /root/.minikube/client.crt
    client-key: /root/.minikube/client.key
```

To view the current context execute the following `kubectl` command:

`kubectl config current-context`{{execute}}


If you want to switch to another context, use the the following command, where **CONTEXT_NAME** is the name of the context


`kubectl config use-context CONTEXT_NAME`


