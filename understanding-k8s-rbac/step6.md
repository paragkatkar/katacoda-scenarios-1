![Configuring Role and RoleBinding Manifests](https://github.com/reselbob/k8sassets/blob/master/rbac/images/roles-bindings.png?raw=true)

The figure above illustrates the manifests for a Role and a RoleBinding.

Notice that the Role's `name` value is `pod-reader` and that the  `namespace` is `test`, The namespace
declaration means that the Role is valid only for resource within the namespace, `test`. Also, the permission
on the Role to get able to `list` and `get` `pods`,

Take a the look at the RoleBinding manifest. Notice that the RoleBind is also in the namespace, `test`.

Notice to that the RoleBinding declares a `subject` of `kind`, `User`. Also, the RoleBinding has a
property, `roleRef`. The property, `roleRef` indicates that the RoleBinding is associated to the a Role
that has a `name`, `pod-reader`.

In the next steps we'll create a set of security credentials for a user, `dictracy`. We'll make it so that
`dictracy` belows to two groups, `devs` and `tech-leads`. Then, we'll use manifests to create Roles and RoleBindings
that will restrict access to the cluster according to the permissions defined in the manifests.
 
 **Next Up:** Reviewing the Certificate Creation Process