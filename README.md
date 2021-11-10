# Meld/IOL2 Sandbox Mysql Image

base image =>  mysql:5.7


## Requirement

Authenticated docker client to AWS Elastic Container Register(ECS)

```console
#!/bin/bash
ACCOUNT='745222113226'   #iol-community account

cliversion=$(aws --version)
[[ $cliversion = aws-cli/1* ]] && aws ecr get-login --no-include-email --region us-east-1 | source /dev/stdin
[[ $cliversion = aws-cli/2* ]] && aws ecr get-login-password --profile $1| docker login --username AWS --password-stdin  ${ACCOUNT}.dkr.ecr.us-east-1.amazonaws.com

```


## Environment Variables

| Name | Required | Default |
|-----|------|---------|
|MYSQL_ROOT_PASSWORD|Yes|``|
|BILIRUBIN_RISK_CHART_HOST|Yes|`https://iol2-bilirubin-risk-chart.interop.community`|
|CONTENT_HOST|Yes|`https://iol2content.interop.community`|
|PATIENT_DATA_MANAGER_HOST|Yes|`https://iol2patient-data-manager.interop.community`|


## Utility Script to rebuild and push newer image to ECS

```console
chmod u+x update.sh
./update.sh
```



