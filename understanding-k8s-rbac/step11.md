<iframe width="560" height="315" src="https://www.youtube.com/embed/35sDtQvG6jw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Step 1:** Let's look at the manifest file that we'll use to create the Kubernetes Role, `pod-reader`. 

```yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: test
  name: pod-reader
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["get", "list"]
```

**Step 2:** Now, create the `pod-access` role that allows only using `kubectl get`. (This is all described in
the manifest file shown above.)

`kubectl apply -f pod-reader.yaml`{{execute}}

You'll get output similar to the following:

`role.rbac.authorization.k8s.io/pod-reader created`

**Step 3:** Let's look at the manifest file that we'll use to create the Kubernetes RoleBinding, `user-pod-reader`.

```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: test
  name: user-pod-reader
subjects:
  - kind: User
    name: dicktracy #name is case sensitive
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

**Step 4:** Create the RoleBinding, `user-pod-reader` that allows the user, `dicktracy` to assume the 
role, `pod-reader`.

`kubectl apply -f user-pod-reader-rolebinding.yaml`{{execute}}

You'll get output similar to the following:

`rolebinding.rbac.authorization.k8s.io/user-pod-reader created`

**Next Up:** Verifying RBAC
