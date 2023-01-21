                 #!/bin/bash

if [ $1 = "VMNAME" -a $2 = "prepare" -a $3 = "begin" ]; then
        /mnt/cache_crutial/hook_scripts/VM-NAME-start.sh &
        /usr/local/emhttp/webGui/scripts/notify -e "Unraid Server Notice" -s "V>
elif [ $1 = "VMNAME" -a $2 = "release" -a $3 = "end" ]; then
        /mnt/cache_crutial/hook_scripts/VM-NAME-stop.sh &
        /usr/local/emhttp/webGui/scripts/notify -e "Unraid Server Notice" -s "V>
fi
exit 0;
