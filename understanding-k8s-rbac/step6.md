<iframe width="560" height="315" src="https://www.youtube.com/embed/MEm9hVJuyFI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

![Configuring Role and RoleBinding Manifests](https://github.com/reselbob/k8sassets/blob/master/rbac/images/roles-bindings.png?raw=true)

The figure above illustrates the manifests for a Role and a RoleBinding.

Notice that the Role's `name` value is `pod-reader` and that the  `namespace` is `test`, The namespace
declaration means that the Role is valid only for resources within the namespace, `test`. Also, the permissions
on the Role to `list` and `get` `pods`,

Take a the look at the RoleBinding manifest. Notice that the RoleBinding is also in the
namespace, `test`.

Notice too that the RoleBinding declares a `subject` of `kind`, `User`. Also, the RoleBinding has a
property, `roleRef`. The property, `roleRef` is configured to declare that the RoleBinding is 
associated to the a Role that has a `name`, `pod-reader`.

In the next steps we'll create a set of security credentials for a user, `dicktracy`. We'll make it so that
`dicktracy` belongs to two groups, `devs` and `tech-leads`. Then, we'll use manifests to create Roles and RoleBindings
that will restrict access that `dicktracy` (and the groups to which that user belongs) to the cluster according to the permissions defined in the manifests.
 
 **Next Up:** Reviewing the Certificate Creation Process