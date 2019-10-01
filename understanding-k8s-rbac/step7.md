<iframe width="560" height="315" src="https://www.youtube.com/embed/MGTFfoL3i2Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

![Certificate Creation Process](https://github.com/reselbob/k8sassets/blob/master/rbac/images/rbac-process.jpeg?raw=true)

The process for creating security certificates for a Kubernetes cluster at the enterprise level involves
two groups, `users` (in blue callout dots) who want access to the cluster according to particular permissions
and `admins` (in purple callout dots) who create the actual access rights.

A user will do the tasks of creating a `key` file and a certificate signing
request file (`csr`).

An admin will create a certificate (`.crt`) based on the information provided in
the `key` file and a certificate signing request (`csr`). Once the `.crt` is 
created, the admin will embed the security artifacts into the cluster's configuration file.

Please be advised that for the purpose of educational demonstration, the following tasks will make it
so the cluster's administrative user, `kubernetes-admin` and the new user we create, `dicktracy` are in the
same Kubernetes `config` file. In the real world, the new user, `dicktracy` would be given a `.config` file
that contains only access information that is particular to the permissions granted to, `dicktracy`.
 
**Next Up:** Creating the Security Certificates