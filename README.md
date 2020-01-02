# infrastructure


Prerequisites
-------------
On the machine where you are running this script,
Ensure you have Ansible setup in your machine
Install python modules boto and awscli

Mac :    
    - sudo easy_install pip
    - pip install --user boto3 botocore
    - pip install awscli --user

Configure aws-cli. Use AWS credentials provided in the aws_credentials.yml
```aws configure``
