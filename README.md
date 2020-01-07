Prerequisites
-------------
On the machine where you are running this script,
Ensure you have Ansible setup in your machine
Install python modules boto and awscli

Ansible roles are tested in Ansible version 2.9.

Mac :
      
    - sudo easy_install pip
    - pip install ansible --user  
    - pip install --user boto3 botocore
    - pip install awscli --user
    - brew install ansible

Configure aws-cli. Use AWS credentials provided in the aws_credentials.yml
```aws configure```

How to encrypt and decrypt Ansible vars:
    Make sure you have vault key present on the ansible.cfg path.
    ```ansible-vault encrypt vars/vars.yml```
    ```ansible-vault decrypt vars/vars.yml```

Comamnd to provision basic infrastructure:

    ```ansible-playbook -i inventory/ vpc.yml -vvv```

Comamnd to provision ec2 proxy instance:

    ```ansible-playbook -i inventory/ec2.py provision.yml -t proxy  -vvvv```

Comamnd to provision ec2 docker instance:

     ```ansible-playbook -i inventory/ provision.yml -t docker-provision  -vvvv```

Extravars for ha-proxy configuration:

    ```ansible-playbook -i inventory/ add_container_dns.yml -e "container_name=censent-managaer-dev docker_host=172.16.2.27 https_port=9051" -vvvv```






