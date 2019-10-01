<iframe width="560" height="315" src="https://www.youtube.com/embed/TPdilqnHA0c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Step 1:** Set the security credentials of `${MAGIC_USER}` (a.k.a `dicktracy`) to the Kubernetes configuration

`kubectl config set-credentials ${MAGIC_USER}@kubernetes --client-certificate=$HOME/.certs/${MAGIC_USER}.crt --client-key=$HOME/.certs/${MAGIC_USER}.key --embed-certs=true`{{execute}}

You'll get output similar to the following:

`User "dicktracy@kubernetes" set.`

**Step 2:** Create a new Kubernetes context

`kubectl config set-context ${MAGIC_USER}@kubernetes --cluster=kubernetes --user=${MAGIC_USER}@kubernetes`{{execute}}

You'll get output similar to the following:

`Context "dicktracy@kubernetes" created.`


**Next Up:** Creating the Required Namespaces

**Step 3:** Let's revisit the configuration to see the addition of the new context containing the new user.

`kubectl config view`{{execute}}

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
    user: dicktracy@kubernetes
  name: dicktracy@kubernetes
- context:
    cluster: kubernetes
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config
preferences: {}
users:
- name: dicktracy@kubernetes
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
- name: kubernetes-admin
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
```
Notice in the above, the addition of the user, `dicktracy@kubernetes`, like so:

```yaml
users:
- name: dicktracy@kubernetes
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
- name: kubernetes-admin
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
```
Also, notice that the user, `dicktracy@kubernetes` now is bound to the cluster in the on the `context` named, `dicktracy@kubernetes`
like so:

```yaml
contexts:
- context:
    cluster: kubernetes
    user: dicktracy@kubernetes
  name: dicktracy@kubernetes
- context:
    cluster: kubernetes
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
```

We're now ready to assign permissions to `dicktracy` using Kubernetes Role and RoleBindings.

**Next Up:** Creating Roles and RoleBindings for a User
