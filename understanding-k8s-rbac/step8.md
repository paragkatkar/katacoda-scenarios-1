<iframe width="560" height="315" src="https://www.youtube.com/embed/tQs3qi_GxB4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Step 1:** Declare the name of the Kubernetes user we're going to support by setting it to an environment
variable

`export MAGIC_USER=dicktracy`{{execute}}

**Step 2:** Generate an RSA key using `openssl`

`openssl genrsa -out dicktracy.key 2048`{{execute}}

This will generate and `dicktracy.key`.

**Step 3:** Create the certificate signing request file, `dicktracy.csr`.

`openssl req -new -key dicktracy.key -out dicktracy.csr -subj "/CN=${MAGIC_USER}/O=devs/O=tech-leads"`{{execute}}

**Step 4:** take a look at the contents of `/etc/kubernetes/pki`

`ls -ltr /etc/kubernetes/pki`{{execute}}

You'll see output similar to the following:

```text
-rw------- 1 root root 1679 Sep 27 06:10 ca.key
-rw-r--r-- 1 root root 1025 Sep 27 06:10 ca.crt
-rw------- 1 root root 1675 Sep 27 06:10 apiserver.key
-rw-r--r-- 1 root root 1216 Sep 27 06:10 apiserver.crt
-rw------- 1 root root 1675 Sep 27 06:10 apiserver-kubelet-client.key
-rw-r--r-- 1 root root 1099 Sep 27 06:10 apiserver-kubelet-client.crt
drwxr-xr-x 2 root root 4096 Sep 27 06:10 etcd
-rw------- 1 root root 1675 Sep 27 06:10 apiserver-etcd-client.key
-rw-r--r-- 1 root root 1090 Sep 27 06:10 apiserver-etcd-client.crt
-rw------- 1 root root 1679 Sep 27 06:10 front-proxy-ca.key
-rw-r--r-- 1 root root 1038 Sep 27 06:10 front-proxy-ca.crt
-rw------- 1 root root 1675 Sep 27 06:10 front-proxy-client.key
-rw-r--r-- 1 root root 1058 Sep 27 06:10 front-proxy-client.crt
-rw------- 1 root root  451 Sep 27 06:10 sa.pub
-rw------- 1 root root 1675 Sep 27 06:10 sa.key
```
Notice that files, `ca.key` and `ca.crt`. These files will be referenced when making the `dicktracy.crt`.


**Step 5:** Create the `dicktracy.crt` file.

`sudo openssl x509 -req -in dicktracy.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out dicktracy.crt -days 500`{{execute}}

**Step 6:** Make a directory, `$HOME/.certs` and move the files, `dicktracy.crt` and `dicktracy.key` into the directory `$HOME/.certs`.

`mkdir -p $HOME/.certs && mv dicktracy.crt dicktracy.key $HOME/.certs`{{execute}}


**Step 7:** Take a look to make sure the certificates got copied in:

`ls -lh $HOME/.certs`{{execute}}