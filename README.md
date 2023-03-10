# unraid_hooks

These hook files run before or after a VM start

## Unraid nvidia-persistenced
These scripts will turn your isolated cpu cores into powersave when the vm is turned off, and before turning it on, it will put them into ondemand scaler.  This will also turn off/on nvidia-persistenced on the selected card, whith newer GPU's, this can save around 20-30W when not in use.

**The GPU has to be in the unraid system, and not passed through in an IOMMU group**

You can still pass this through to a vm, and unraid will release the card as long as it's not currently being used for another vm or docker.

1. Add the following to your */boot/config/go* file to start nvidia-persistenced on boot
```
# set Nvidia Persistent
nvidia-persistenced &
```

2. Copy hook_scripts.sh to */etc/libvirt/hooks/qemu.d/hook_scripts.sh*

3. Create a folder in */mnt/user* called *hook_scripts* (or anywhere else you want)

4. Place the vm-*NAME*-start and vm-*NAME*-stop scripts in the folder and update *hook_scripts.sh* accordingly

5. Edit *hook_scripts.sh* for your vm, changing;

> *mnt/cache_crutial/hook_scripts/VM-name-stop.sh* to your stop script location

> *mnt/cache_crutial/hook_scripts/VM-name-start.sh* to your start script location

> *$1 = "VMNAME">* to your VM's name


6. Edit the vm start stop scripts for your use case

>*nvidia-smi -i 0* set *-i* to the number of your passed through gpu, this can be found running *nvidia-smi*

>*((i=6;i<12;i++));* set these to your cores you have isolated for the vm.

In my case, it is cores 6-11, with the hyper threaded cores 18-23



