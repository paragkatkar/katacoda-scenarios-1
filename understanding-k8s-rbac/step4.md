![RBAC Roles](https://github.com/reselbob/k8sassets/blob/master/rbac/images/RBAC-Role.jpeg?raw=true)

As mentioned in the previous step,  The association to `operations` to `resources` is what is known as a `Role`.
 
The figure above illustrates a Kubernetes Role, `pds-viewer`. The Role, `pds-viewer` is able to `list` and
`get` the Kubernetes resources, `pod`, `deployment` and `service`.

In other words, the Role, `pds-viewer` can do the following:

`kubectl get pods`

`kubectl get services`

`kubectl get deployments`

The Role, `pds-viewer` **cannot** do the following:

`kubectl delete pods`

`kubectl expose deployment mydeployment --type=NodePort`

`kubectl delete service myservice`


**Next Up:**  Understanding Kubernetes RoleBindings

