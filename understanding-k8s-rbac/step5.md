<iframe width="560" height="315" src="https://www.youtube.com/embed/IuAtaZ_nF1o" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

![RBAC RoleBindings](https://github.com/reselbob/k8sassets/blob/master/rbac/images/RBAC-RoleBinding.jpeg?raw=true)

As mentioned previously in Step 3, the assignment of a `Role` to a subject -- a user, group or even a services (process) -- is the purpose of
a `RoleBinding`.

The illustration above describes a RoleBinding in which a user, `reselbob` is assigned to the Role, `pds-viewer`.
Also, the group, `Developers` is assigned to the Role, `pds-viewer`.

The next step will show how how to create a Role and RoleBinding using a manifest.
 
 **Next Up:** Configuring Role and RoleBinding Manifests