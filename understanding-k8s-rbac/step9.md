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
  name: testers
  labels:
    name: testers
```

**Step 1:** Execute the manifest that contains declarations for the namespaces, `devs` and `test`

`kubectl apply -f namespaces.yaml`{{execute}}
 
 **Step 2:** Check that the namespaces have been created
 
 `kubectl get ns`{{execute}}
 