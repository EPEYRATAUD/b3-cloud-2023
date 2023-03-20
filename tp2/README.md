test ping

```
targa@LAPTOP-JHK9K6A7:~/b3-cloud - Jonction/tp2/ansible$ ansible ynov -i inventories/vagrant_lab/hosts.ini -m ping
node2.tp2.cloud | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
node1.tp2.cloud | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

test first.yaml

```
targa@LAPTOP-JHK9K6A7:~/b3-cloud - Jonction/tp2/ansible$ ansible-playbook -i inventories/vagrant_lab/hosts.ini playbooks/first.yml

PLAY [Install vim] *****************************************************************************************************************************************************************
TASK [Gathering Facts] *************************************************************************************************************************************************************ok: [node1.tp2.cloud]
ok: [node2.tp2.cloud]

TASK [Install vim] *****************************************************************************************************************************************************************ok: [node2.tp2.cloud]
ok: [node1.tp2.cloud]

PLAY RECAP *************************************************************************************************************************************************************************node1.tp2.cloud            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node2.tp2.cloud            : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

test user

```
targa@LAPTOP-JHK9K6A7:~/b3-cloud - Jonction/tp2/ansible$ ansible-playbook -i inventories/vagrant_lab/hosts.ini playbooks/main.yaml

PLAY [ynov] ************************************************************************************************************************************************************************
TASK [Gathering Facts] *************************************************************************************************************************************************************ok: [node2.tp2.cloud]
ok: [node1.tp2.cloud]

TASK [common : Install common packages] ********************************************************************************************************************************************ok: [node1.tp2.cloud] => (item=vim)
ok: [node2.tp2.cloud] => (item=vim)
ok: [node2.tp2.cloud] => (item=git)
ok: [node1.tp2.cloud] => (item=git)
ok: [node1.tp2.cloud] => (item=rsync)

TASK [common : import users] *******************************************************************************************************************************************************changed: [node1.tp2.cloud] => (item=le_nain)
changed: [node2.tp2.cloud] => (item=le_nain)
changed: [node1.tp2.cloud] => (item=l_elfe)
changed: [node2.tp2.cloud] => (item=l_elfe)
changed: [node1.tp2.cloud] => (item=le_ranger)
changed: [node2.tp2.cloud] => (item=le_ranger)

PLAY RECAP *************************************************************************************************************************************************************************node1.tp2.cloud            : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node2.tp2.cloud            : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

test nginx

```
targa@LAPTOP-JHK9K6A7:~/b3-cloud - Jonction/tp2/ansible$ ansible-playbook -i inventories/vagrant_lab/hosts.ini playbooks/main.yaml

PLAY [ynov] ************************************************************************************************************************************************************************
TASK [Gathering Facts] *************************************************************************************************************************************************************ok: [node2.tp2.cloud]
ok: [node1.tp2.cloud]

TASK [common : Install common packages] ********************************************************************************************************************************************ok: [node2.tp2.cloud] => (item=vim)
ok: [node1.tp2.cloud] => (item=vim)
ok: [node2.tp2.cloud] => (item=git)
ok: [node1.tp2.cloud] => (item=git)
ok: [node1.tp2.cloud] => (item=rsync)

TASK [common : import users] *******************************************************************************************************************************************************ok: [node1.tp2.cloud] => (item=le_nain)
ok: [node2.tp2.cloud] => (item=le_nain)
ok: [node1.tp2.cloud] => (item=l_elfe)
ok: [node2.tp2.cloud] => (item=l_elfe)
ok: [node1.tp2.cloud] => (item=le_ranger)
ok: [node2.tp2.cloud] => (item=le_ranger)

TASK [nginx : Installer NGINX] *****************************************************************************************************************************************************ok: [node1.tp2.cloud]
changed: [node2.tp2.cloud]

TASK [nginx : Main NGINX config file] **********************************************************************************************************************************************changed: [node2.tp2.cloud]
changed: [node1.tp2.cloud]

TASK [nginx : Create webroot] ******************************************************************************************************************************************************changed: [node2.tp2.cloud]
changed: [node1.tp2.cloud]

TASK [nginx : Create index] ********************************************************************************************************************************************************changed: [node1.tp2.cloud]
changed: [node2.tp2.cloud]

TASK [nginx : NGINX Virtual Host] **************************************************************************************************************************************************changed: [node2.tp2.cloud]
changed: [node1.tp2.cloud]

PLAY RECAP *************************************************************************************************************************************************************************node1.tp2.cloud            : ok=8    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node2.tp2.cloud            : ok=8    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

test common

```
targa@LAPTOP-JHK9K6A7:~/b3-cloud - Jonction/tp2/ansible$ ansible-playbook -i inventories/vagrant_lab/hosts.ini playbooks/main.yaml

PLAY [ynov] *****************************************************************************************************************************************************************
TASK [Gathering Facts] ******************************************************************************************************************************************************ok: [node2.tp2.cloud]
ok: [node1.tp2.cloud]

TASK [common : Install common packages] *************************************************************************************************************************************ok: [node1.tp2.cloud] => (item=vim)
ok: [node2.tp2.cloud] => (item=vim)
ok: [node1.tp2.cloud] => (item=git)
ok: [node2.tp2.cloud] => (item=git)
ok: [node1.tp2.cloud] => (item=rsync)

TASK [common : créer le groupe si non existant] *****************************************************************************************************************************ok: [node1.tp2.cloud]
ok: [node2.tp2.cloud]

TASK [common : import users] ************************************************************************************************************************************************ok: [node1.tp2.cloud] => (item={'name': 'le_nain', 'password': '$6$CdovIXy.PEO8BRRS$.IvFiHfYF0ef5kABGLnqu5uynkuGZlOh9ZDu/FAW77xkI3Q9D64JcgcQxeYwjYb7tczCpVEGe6ZBXsy7.bWg/.',  '/home/le_nain', 'shell': '/bin/bash', 'group': 'admin', 'sudo': True, 'ssh_public_key': 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYrb/iNaFzOZxpY62Y0o5/uiKB8jq6GUxHbre+qMOTC26+snPbwpcIcy5XrKRmU5FbPpqjVryPXM/tGfsA4b4n5JoHhrEvHPkMQI5kMagyqjw/PSGvy3/0ers1rJUxwf2S5halFml4y56yynm53HfXPCcAMsIlD4R0WcgkttSViycioCmvHc3yzcY5ymw4GsTUjOyrZUbnAPjphRnoliGBfYnWVZSRPanpuMjjWaw2VILlTO6FA+Dp4KiUFEx4eNcim9iU+llNrJTsFd4LvEyk24QQKYufSQl6aiAc2Z1pU0U++PO4i1hg0AXyFk9pA4vSKd4l+jrymZpJVWnTfAuet3RQUhVrzHHhTZZI6z8WBpg0xORMxhBf6UanST3n6/lNfgAkMlne7Sx1gB+lWZmLRPNuu72jCALVLWgMIPhm33KtnhYgoT3OnGERMKjgmDl3zURl351YRrXjPiEDpvrb2YO9zNy9k72h1rCLZyOvb0= lucas@LAPTOP-JHK9K6A7'})
ok: [node2.tp2.cloud] => (item={'name': 'le_nain', 'password': '$6$CdovIXy.PEO8BRRS$.IvFiHfYF0ef5kABGLnqu5uynkuGZlOh9ZDu/FAW77xkI3Q9D64JcgcQxeYwjYb7tczCpVEGe6ZBXsy7.bWg/.',  '/home/le_nain', 'shell': '/bin/bash', 'group': 'admin', 'sudo': True, 'ssh_public_key': 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYrb/iNaFzOZxpY62Y0o5/uiKB8jq6GUxHbre+qMOTC26+snPbwpcIcy5XrKRmU5FbPpqjVryPXM/tGfsA4b4n5JoHhrEvHPkMQI5kMagyqjw/PSGvy3/0ers1rJUxwf2S5halFml4y56yynm53HfXPCcAMsIlD4R0WcgkttSViycioCmvHc3yzcY5ymw4GsTUjOyrZUbnAPjphRnoliGBfYnWVZSRPanpuMjjWaw2VILlTO6FA+Dp4KiUFEx4eNcim9iU+llNrJTsFd4LvEyk24QQKYufSQl6aiAc2Z1pU0U++PO4i1hg0AXyFk9pA4vSKd4l+jrymZpJVWnTfAuet3RQUhVrzHHhTZZI6z8WBpg0xORMxhBf6UanST3n6/lNfgAkMlne7Sx1gB+lWZmLRPNuu72jCALVLWgMIPhm33KtnhYgoT3OnGERMKjgmDl3zURl351YRrXjPiEDpvrb2YO9zNy9k72h1rCLZyOvb0= lucas@LAPTOP-JHK9K6A7'})
ok: [node1.tp2.cloud] => (item={'name': 'l_elfe', 'password': '$6$CdovIXy.PEO8BRRS$.IvFiHfYF0ef5kABGLnqu5uynkuGZlOh9ZDu/FAW77xkI3Q9D64JcgcQxeYwjYb7tczCpVEGe6ZBXsy7.bWg/.', '
'/home/l_elfe', 'shell': '/bin/bash', 'group': 'admin', 'sudo': True, 'ssh_public_key': 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYrb/iNaFzOZxpY62Y0o5/uiKB8jq6GUxHbre+qMOTC2x1snPbwpcIcy5XrKRmU5FbPpqjVryPXM/tGfsA4b4n5JoHhrEvHPkMQI5kMagyqjw/PSGvy3/0ers1rJUxwf2S5halFml4y56yynm53HfXPCcAMsIlD4R0WcgkttSViycioCmvHc3yzcY5ymw4GsTUjOyrZUbnAPjphRnoliGBfYnYJZSRPanpuMjjWaw2VILlTO6FA+Dp4KiUFEx4eNcim9iU+llNrJTsFd4LvEyk24QQKYufSQl6aiAc2Z1pU0U++PO4i1hg0AXyFk9pA4vSKd4l+jrymZpJVWnTfAuet3RQUhVrzHHhTZZI6z8WBpg0xORMxhBf6UanST3n6/lNfgAkqyne7Sx1gB+lWZmLRPNuu72jCALVLWgMIPhm33KtnhYgoT3OnGERMKjgmDl3zURl351YRrXjPiEDpvrb2YO9zNy9k72h1rCLZyOvb0= lucas@LAPTOP-JHK9K6A7'})
ok: [node2.tp2.cloud] => (item={'name': 'l_elfe', 'password': '$6$CdovIXy.PEO8BRRS$.IvFiHfYF0ef5kABGLnqu5uynkuGZlOh9ZDu/FAW77xkI3Q9D64JcgcQxeYwjYb7tczCpVEGe6ZBXsy7.bWg/.', '
'/home/l_elfe', 'shell': '/bin/bash', 'group': 'admin', 'sudo': True, 'ssh_public_key': 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYrb/iNaFzOZxpY62Y0o5/uiKB8jq6GUxHbre+qMOTC2x1snPbwpcIcy5XrKRmU5FbPpqjVryPXM/tGfsA4b4n5JoHhrEvHPkMQI5kMagyqjw/PSGvy3/0ers1rJUxwf2S5halFml4y56yynm53HfXPCcAMsIlD4R0WcgkttSViycioCmvHc3yzcY5ymw4GsTUjOyrZUbnAPjphRnoliGBfYnYJZSRPanpuMjjWaw2VILlTO6FA+Dp4KiUFEx4eNcim9iU+llNrJTsFd4LvEyk24QQKYufSQl6aiAc2Z1pU0U++PO4i1hg0AXyFk9pA4vSKd4l+jrymZpJVWnTfAuet3RQUhVrzHHhTZZI6z8WBpg0xORMxhBf6UanST3n6/lNfgAkqyne7Sx1gB+lWZmLRPNuu72jCALVLWgMIPhm33KtnhYgoT3OnGERMKjgmDl3zURl351YRrXjPiEDpvrb2YO9zNy9k72h1rCLZyOvb0= lucas@LAPTOP-JHK9K6A7'})
ok: [node1.tp2.cloud] => (item={'name': 'le_ranger', 'password': '$6$CdovIXy.PEO8BRRS$.IvFiHfYF0ef5kABGLnqu5uynkuGZlOh9ZDu/FAW77xkI3Q9D64JcgcQxeYwjYb7tczCpVEGe6ZBXsy7.bWg/.'': '/home/le_ranger', 'shell': '/bin/bash', 'group': 'admin', 'sudo': True, 'ssh_public_key': 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYrb/iNaFzOZxpY62Y0o5/uiKB8jq6GUxHbre+qMcyRm6+snPbwpcIcy5XrKRmU5FbPpqjVryPXM/tGfsA4b4n5JoHhrEvHPkMQI5kMagyqjw/PSGvy3/0ers1rJUxwf2S5halFml4y56yynm53HfXPCcAMsIlD4R0WcgkttSViycioCmvHc3yzcY5ymw4GsTUjOyrZUbnAPjphRnoliGPnOhWVZSRPanpuMjjWaw2VILlTO6FA+Dp4KiUFEx4eNcim9iU+llNrJTsFd4LvEyk24QQKYufSQl6aiAc2Z1pU0U++PO4i1hg0AXyFk9pA4vSKd4l+jrymZpJVWnTfAuet3RQUhVrzHHhTZZI6z8WBpg0xORMxhBf6UanST3n6/lNvNP4Mlne7Sx1gB+lWZmLRPNuu72jCALVLWgMIPhm33KtnhYgoT3OnGERMKjgmDl3zURl351YRrXjPiEDpvrb2YO9zNy9k72h1rCLZyOvb0= lucas@LAPTOP-JHK9K6A7'})
ok: [node2.tp2.cloud] => (item={'name': 'le_ranger', 'password': '$6$CdovIXy.PEO8BRRS$.IvFiHfYF0ef5kABGLnqu5uynkuGZlOh9ZDu/FAW77xkI3Q9D64JcgcQxeYwjYb7tczCpVEGe6ZBXsy7.bWg/.'': '/home/le_ranger', 'shell': '/bin/bash', 'group': 'admin', 'sudo': True, 'ssh_public_key': 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYrb/iNaFzOZxpY62Y0o5/uiKB8jq6GUxHbre+qMcyRm6+snPbwpcIcy5XrKRmU5FbPpqjVryPXM/tGfsA4b4n5JoHhrEvHPkMQI5kMagyqjw/PSGvy3/0ers1rJUxwf2S5halFml4y56yynm53HfXPCcAMsIlD4R0WcgkttSViycioCmvHc3yzcY5ymw4GsTUjOyrZUbnAPjphRnoliGPnOhWVZSRPanpuMjjWaw2VILlTO6FA+Dp4KiUFEx4eNcim9iU+llNrJTsFd4LvEyk24QQKYufSQl6aiAc2Z1pU0U++PO4i1hg0AXyFk9pA4vSKd4l+jrymZpJVWnTfAuet3RQUhVrzHHhTZZI6z8WBpg0xORMxhBf6UanST3n6/lNvNP4Mlne7Sx1gB+lWZmLRPNuu72jCALVLWgMIPhm33KtnhYgoT3OnGERMKjgmDl3zURl351YRrXjPiEDpvrb2YO9zNy9k72h1rCLZyOvb0= lucas@LAPTOP-JHK9K6A7'})

TASK [nginx : Installer NGINX] **********************************************************************************************************************************************ok: [node2.tp2.cloud]
ok: [node1.tp2.cloud]

TASK [nginx : Main NGINX config file] ***************************************************************************************************************************************ok: [node1.tp2.cloud]
ok: [node2.tp2.cloud]

TASK [nginx : Create webroot] ***********************************************************************************************************************************************ok: [node1.tp2.cloud]
ok: [node2.tp2.cloud]

TASK [nginx : Create index] *************************************************************************************************************************************************ok: [node2.tp2.cloud]
ok: [node1.tp2.cloud]

TASK [nginx : NGINX Virtual Host] **************************************************************************************************************************************************ok: [node1.tp2.cloud]
ok: [node2.tp2.cloud]

TASK [nginx : Ouvrir le port 8082 via firewalld] ***********************************************************************************************************************************ok: [node1.tp2.cloud]
ok: [node2.tp2.cloud]

TASK [nginx : Ouvrir le port 8083 via firewalld] ***********************************************************************************************************************************ok: [node1.tp2.cloud]
ok: [node2.tp2.cloud]

PLAY RECAP *************************************************************************************************************************************************************************node1.tp2.cloud            : ok=11   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node2.tp2.cloud            : ok=11   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
