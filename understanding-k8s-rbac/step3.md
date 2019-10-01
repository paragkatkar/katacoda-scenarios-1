<iframe width="560" height="315" src="https://www.youtube.com/embed/4QWwdHN4y8w" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

![Subjects Resources Operations](https://github.com/reselbob/k8sassets/blob/master/rbac/images/RBAC-items.jpeg?raw=true)

The trick to understanding the Kubernetes API Resources [Role and RoleBinding](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
is to think of the structure of an action taken in Kubernetes to be similar to a sentence.

Just about every sentence has a `noun`, a `verb` and an `oject`. For example:

`Bill eats candy.`

**WHERE**

* `Bill` is the noun.
* `eats` is the verb
* `candy` is the object

Now let's look at a `kubectl` expression:

`kubectl get pods`

You can think of the sentence above as one in which the "noun" is the current `user` defined
in the `current-context`. The verb is `get` and the object is `pods`.

This is the fundamental concept behind the Kubernetes security framework. A user or group
is given permission to perform actions (illustrated as `operations` in the figure above) upon
certain 'resources'. The association of `operations` to `resources` is what is known as a `Role`.

The assignment of a `Role` to a subject -- a user, group or even a service (process) 
-- is the purpose of a `RoleBinding`.

 **Next Up:** Understanding Kubernetes Roles