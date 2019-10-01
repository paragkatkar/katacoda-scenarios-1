<iframe width="560" height="315" src="https://www.youtube.com/embed/ba5gKKuFLso" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Step 1:**  Move into the context that supports `dicktracy`

`kubectl config use-context ${MAGIC_USER}@kubernetes`{{execute}}

You'll get output as follows"

`Switched to context "dicktracy@kubernetes".`

**Step 2:** Try to create a pod in the namespace, `test`

`kubectl run --generator=run-pod/v1 pinger-dk --image=reselbob/pinger:v2.3 -n test`{{execute}}

You'll fail with following error messsage:

`Error from server (Forbidden): pods is forbidden: User "dicktracy" cannot create resource "pods"
in API group "" in the namespace "test": RBAC: role.rbac.authorization.k8s.io "pod-reader" not found`

Why? Because the user `dicktracy` does not have permission to `create` a pod.

**Step 3:** But try to view pods in the namespace, `test`

`kubectl get pods -n test`{{execute}}

You'll get output as follows:

`No resources found.`

This is good news because although there happens to be no pods found, you are not being denied permission
to view pods. Earlier on you were.

**Step 4:** Let's switch back to the context, ` kubernetes-admin@kubernetes` and see what we can accomplish.

`kubectl config use-context kubernetes-admin@kubernetes`{{execute}}

You'll get output as follows:

`Switched to context "kubernetes-admin@kubernetes".`

**Step 5:** Now try to create the deployment:

`kubectl run --generator=run-pod/v1 pinger-dk --image=reselbob/pinger:v2.3 -n test`{{execute}}

You'll output as follows:

`pod/pinger-dk created`

**Why can we do this?** Because we switched back to the context, `kubernetes-admin@kubernetes` and the user in this context,
`kubernetes-admin` has permission to create pods.

**Step 6:** Let's verify that the newly created pod is indeed there:

`kubectl get pods -n test`{{execute}}

You'll get output similar to the following:

```text
NAME        READY   STATUS    RESTARTS   AGE
pinger-dk   1/1     Running   0          54s
```
**Next Up:** Creating Roles and RoleBindings for Groups
