This is my learning content for Docker.

# Deeplearning-entry

“Deeplearning-entry” is a tutorial of Docker with Deeplearning.

Example：

![Deeplearning](https://user-images.githubusercontent.com/111184429/185789387-0df7dee5-52bb-4da8-8d3f-49d171216c96.png)

# Useage

1. Create GPU Instance on AWS

> * AMI：Ubuntu Server 20.04 LTS (HVM)
> * Instance type：P2.xlarge
> * Storage：20GiB

2. Install Docker

```
$ sudo apt-get update
```
```
$ sudo apt-get install docker.io
```
```
$ sudo gpasswd -a ubuntu docker
```

3. Install GPU　Driver

```
$ sudo apt install ubuntu-drivers-common
```
```
$ sudo apt-get install nvidia-driver-470
```
```
$ sudo systemctl reboot
```
```
$ nvidia-smi
```
```
$ mkdir ~/dsenv_build
```


4. Install container-toolkit

```
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```
```
$ sudo apt-get update
```
```
$ sudo apt-get install -y nvidia-docker2
```
```
$ sudo systemctl restart docker
```
```
$ sudo docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu20.04 nvidia-smi
```

5. Upload & Build Dockerfile

```
$ sftp -i {key-pair} ubuntu@hostname
```
```
$ put {local/path} ~/dsenv_build
```
```
$ exit
```
```
$ ssh -i {key-pair} ubuntu@hostname
```
```
$ cd ~/dsenv_build
```
```
$ docker build .
```

6. Run Dockerimage
```
$ docker images
```
```
$ docker run --gpus all -v ~/ds_work:/work -p 8888:8888 {image}
```

7. Access 'Public DNS:8888' !!!
