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
```AWS Access Key ID: <AWS ACCESS KEY>```
```AWS Secret Access Key: <AWS Secret Access Key>```
```Default region name: <ap-south-1>```
```Default output format: <json>```

How to encrypt and decrypt Ansible vars:
    Make sure you have vault key present on the ansible.cfg path (~/.keys/projecteka_secret).
    ```ansible-vault encrypt vars/vars.yml```
    ```ansible-vault decrypt vars/vars.yml```

Add vars/ec2_key.pem key to connect to AWS:

   ```eval "$(ssh-agent -s)"```
   ```ansible-vault decrypt group_vars/ec2_key.pem```
   ```ssh-add group_vars/ec2_key.pem```

To create a new VPC and basic infrastructure, the following command is executed:

    ```ansible-playbook -i inventory/ vpc.yml -vvv```

To create a new ec2 Instance, the following command is executed:

    ```ansible-playbook -i inventory/ create_instance.yml  -vvv```

To provision a ec2 proxy Instance, the following command is executed

    ```ansible-playbook -i inventory/ provision.yml -t proxy  -vvv```

To provision a ec2 docker Instance, the following command is executed:

     ```ansible-playbook -i inventory/ provision.yml -t docker-provision  -vvv```

Update Ha-proxy configuration to add container dns:

    ```ansible-playbook -i inventory/ add_container_dns.yml -e "container_name=consent-manager-dev docker_host=<dockernode01-IP> https_port=9051" -vvvv```
    ```ansible-playbook -i inventory/ add_container_dns.yml -e "container_name=hip-dev docker_host=<dockernode01-IP> https_port=9052" -vvvv```
    ```ansible-playbook -i inventory/ add_container_dns.yml -e "container_name=hiu-dev docker_host=<dockernode01-IP> https_port=9052" -vvvv```
    ```ansible-playbook -i inventory/ add_container_dns.yml -e "container_name=hook docker_host=<dockernode01-IP> https_port=8555" -vvvv```







