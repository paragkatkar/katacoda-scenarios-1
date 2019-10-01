<iframe width="560" height="315" src="https://www.youtube.com/embed/Qe9CCQ0CP1s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Before we start we need to understand the purpose and structure of the Kubernetes cluster configuration.
 
Take a look at the Kubernetes configuration

`clear && kubectl config view`{{execute}}

```yaml
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://172.17.0.8:6443
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
```
 Notice that at this time there is only a single `context` in the configuration. It has the name, `kubernetes-admin@kubernetes`.
 
 The context declares a user, `kubernetes-admin` and that user is bound to the cluster, `kubernetes`, which is the only cluster
 in force under Katacoda. It is quite possible to have a configuration which describes many clusters and defines contexts that
 describe many different binds of users to clusters.
 
 But, for now we'll work the single cluster.
 
 In this scenario, we're going to create a new user, `dicktracy` and bind that user to the cluster, `kubernetes`. Also, we're
 going to make it so that the user, `dicktracy` will belong to two groups, `devs` and `tech-leads`. We'll use Kubernetes Role
 RoleBindings to make it so that the user, `dicktracy` has a particular set of permissions. Also, we'll make it so that the 
 group, `devs` has special permissions too.
 
 Because `dicktracy` will belong to the group, `devs` that user's permissions will be expanded according to the permissions
 given to the group, `devs`.
  
 **Next Up:** Understanding Subjects, Resources, and Operations in Kubernetes