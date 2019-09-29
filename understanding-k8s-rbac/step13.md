**Step 1:** Switch back to being the admin in the context `kubernetes`.

`kubectl config use-context kubernetes-admin@kubernetes`{{execute}}

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

**FRIENDLY REMINDER:** We assigned to the user `dicktracy` to the group `devs` when we created dicktracy's security certificates
back in Step 8, in this command:

`openssl req -new -key dicktracy.key -out dicktracy.csr -subj "/CN=${MAGIC_USER}/O=devs/O=tech-leads"`

In the  option, `-subj`, like so:

`-subj "/CN=${MAGIC_USER}/O=devs/O=tech-leads`

**WHERE**

* `/CN=${MAGIC_USER}` is the name of the user
* `/O=devs/` declares a group, `devs`
* `/O=devs/` declares a group, `tech-leads`

**Step 3:** Create the `simple-pod-developer` Role that allows creating and listing pods as defined in the YAML file above.

`kubectl apply -f simple-dev-role.yaml`{{execute}}

You'll get output as follows:

``

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

``

**Step 5:** Now, switch back to be `dicktracy`
**Step 5:** Now, switch back to be `dicktracy`

`kubectl config use-context ${MAGIC_USER}@kubenetes`{{execute}}

Run this command: 

`kubectl run --generator=run-pod/v1 pinger-dk --image=reselbob/pinger:v2.1 -n devs`{{execute}}