**Step 1:** Switch back to being the admin in the context `kubernetes`.

`kubectl config use-context kubernetes-admin@kubernetes`{{execute}}

You'll get output as follows:

`Switched to context "kubernetes-admin@kubernetes"`

**Step 2:** Let's take a look at the manifest for the Role that we'll apply to the group, `devs`

```yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: devs
  name: simple-pod-developer
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["create","get", "list"]
```

**FRIENDLY REMINDER:** We assigned the user `dicktracy` to the group `devs` when we created dicktracy's security certificates
back in Step 8, in this command:

`openssl req -new -key dicktracy.key -out dicktracy.csr -subj "/CN=${MAGIC_USER}/O=devs/O=tech-leads"`

In the  option, `-subj`, like so:

`-subj "/CN=${MAGIC_USER}/O=devs/O=tech-leads`

**WHERE**

* `/CN=${MAGIC_USER}` is the name of the user
* `/O=devs/` declares a group, `devs`
* `/O=devs/` declares a group, `tech-leads`

**Step 3:** Create the `simple-pod-developer` Role that allows creating and listing pods as we defined in the YAML file above.

`kubectl apply -f simple-dev-role.yaml`{{execute}}

You'll get output as follows:

`role.rbac.authorization.k8s.io/simple-pod-developer created`

**Step 4:** Let's take a look at the manifest we'll use to create the RoleBinding that associates the group, `devs` with the Role,
`simple-pod-developer`.

```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: devs
  name: simple-pod-developers
subjects:
  - kind: Group
    name: devs
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: simple-pod-developer
  apiGroup: rbac.authorization.k8s.io
```

**Step 4:** Create the RoleBinding, `simple-pod-developers` that allows the group, `devs` to assume the 
role, `simple-pod-developer`.

`kubectl apply -f simple-dev-rolebinding.yaml`{{execute}}

You'll get output as follows:

`rolebinding.rbac.authorization.k8s.io/simple-pod-developers create`

**Step 5:** Now, switch back to be `dicktracy`

`kubectl config use-context ${MAGIC_USER}@kubernetes`{{execute}}

You'll get output as follows:

`Switched to context "dicktracy@kubernetes".`

Run this command: 

`kubectl run --generator=run-pod/v1 pinger-dk --image=reselbob/pinger:v2.3 -n devs`{{execute}}

You'll get output as follows:

`pod/pinger-dk created`

**Step 6:** Let's see if indeed `dicktracy` could make pods by virtue of the fact that the user is in the group `devs`.

`kubectl get pods -n devs`{{execute}}

You'll get output as follows:

```text
NAME        READY   STATUS    RESTARTS   AGE
pinger-dk   1/1     Running   0          2m13s
```

**But wait!** Something mysterious just happened. Didn't we create a pod named, `pinger-dk` in the previous step? How could this have 
happened? How could we have made it so that Kubernetes accepted two pods with the same name. Jeepers! Are pod names supposed
to be unique?

Let's answer the question by switching back to the use `kubernetes-admin`.

**Step 7:** Switch back to be `kubernetes-admin` by changing the context.

`kubectl config use-context kubernetes-admin@kubernetes`{{execute}}

You'll get output as follows:

`Switched to context "kubernetes-admin@kubernetes".`

**Step 8:** Let's get the pods in all namespaces and filter by the pod name, `pinger-dk`

`kubectl get pods  --all-namespaces | grep pinger-dk`{{execute}}

You'll get output as follows:

```text
devs          pinger-dk                                 1/1     Running   0          12m
test          pinger-dk                                 1/1     Running   0          17m
```
The first column in the output shown above is the namespace. Notice that the namespace, `devs` has a pod named, `pinger-dk` and
the namespace `test` has a pod named, `pinger-dk`. This is perfectly OK. You can have pods with duplicate names as long as
each pod is in a distinct namespace.

**Congratulations on completing the last step in this scenario!**