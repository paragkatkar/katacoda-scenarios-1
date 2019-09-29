**Step 1:** Set the security credentials of `${MAGIC_USER}` (a.k.a `dicktracy`) to the Kubernetes configuration

`kubectl config set-credentials ${MAGIC_USER}@kubernetes --client-certificate=$HOME/.certs/${MAGIC_USER}.crt --client-key=$HOME/.certs/${MAGIC_USER}.key --embed-certs=true`{{execute}}

**Step 2:** Create a new Kubernetes context

`kubectl config set-context ${MAGIC_USER}@kubernetes --cluster=kubernetes --user=${MAGIC_USER}@kubernetes`{{execute}}
