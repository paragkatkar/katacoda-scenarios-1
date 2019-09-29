# Verifying RBAC

**Step 1:**  Move into the context that supports `dicktracy`

`kubectl config use-context ${MAGIC_USER}@kubenetes`{execute}

**Step 2:** Try to create a pod in the namespace, `test`

`kubectl run --generator=run-pod/v1 pinger-dk --image=reselbob/pinger:v2.3 -n test`{execute}

You'll fail.

**Step 3:** But try to view pods in the namespace, `test`

`kubectl get pods -n test`{execute}
