## **jump** docker image

Creates a minimal alpine linux container with useful utilities and DNS lookup related tools. Notable included tools are:

- `bash`
- `curl`
- `dig`
- `jq`
- `nc`
- `nslookup`
- `screen` 
- `sh`

The container has no entry-point defined. When using as a docker container, one can start an interactive bash shell like:

```
docker run -it maliksalman/jump bash
```

The bove container will terminate as soon you exit out of the bash shell. If starting it as a POD in kubernetes so it can be used as a `jump` POD, the following YAML can be used to create it:

```
apiVersion: v1
kind: Pod
metadata:
  name: jumpy
spec:
  containers:
  - name: jump
    image: maliksalman/jump
    command:
      - sleep
      - 168h
```

The above will create a POD that will stay alive for a week. To create an interactive bash shell, issue the following command:

```
kubectl exec -it jumpy bash 
```