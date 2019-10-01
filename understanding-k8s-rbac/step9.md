<iframe width="560" height="315" src="https://www.youtube.com/embed/-FG6s4_hnRw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

We'll create two namespaces using this manifest:

```yaml
kind: Namespace
apiVersion: v1
metadata:
  name: devs
  labels:
    name: devs
---
kind: Namespace
apiVersion: v1
metadata:
  name: test
  labels:
    name: test
```

**Step 1:** Execute the manifest that contains declarations for the namespaces, `devs` and `test`

`kubectl apply -f namespaces.yaml`{{execute}}

You'll get output similar to the following:

```text
namespace/devs created
namespace/test created
```
 
 **Step 2:** Check that the namespaces have been created
 
 `kubectl get ns`{{execute}}
 
 You'll get output similar to the following:
 
 ```text
NAME              STATUS   AGE
default           Active   31m
devs              Active   1s
kube-node-lease   Active   31m
kube-public       Active   31m
kube-system       Active   31m
test              Active   1s
```
 
 All is well.
 
 **Next Up:** Creating a Cluster Context for the New User