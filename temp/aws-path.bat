set path=%path%;"c:\Users\fabiano.silva\AppData\Roaming\Python\Python36\Scripts"

#aws cloudformation create-stack --template-body file://ecs-cluster.template --stack-name EcsClusterStack --capabilities CAPABILITY_IAM --tags Key=Name,Value=ECS --region us-west-2 --parameters ParameterKey=KeyName,ParameterValue=<key_name> ParameterKey=EcsCluster,ParameterValue=getting-started ParameterKey=AsgMaxSize,ParameterValue=2

aws cloudformation create-stack --template-body file://ecs-cluster.template --stack-name EcsClusterStack --capabilities CAPABILITY_IAM --tags Key=Name,Value=ECS --region us-west-2 --parameters ParameterKey=KeyName,ParameterValue=aws2019 ParameterKey=EcsCluster,ParameterValue=getting-started ParameterKey=AsgMaxSize,ParameterValue=2

aws cloudformation create-stack --template-body file://ecs-jenkins-demo.template --stack-name JenkinsStack --capabilities CAPABILITY_IAM --tags Key=Name,Value=Jenkins --region us-west-2 --parameters ParameterKey=EcsStackName,ParameterValue=EcsClusterStack

aws ec2 describe-instances --filters "Name=tag-value","Values=JenkinsStack" | jq .Reservations[].Instances[].PublicDnsName

ec2-54-184-201-95.us-west-2.compute.amazonaws.com
jenkinsPassword     8864d3ab85fb4a24a3c5812b449bba27

aws ecr create-repository --repository-name hello-world --region us-west-2
{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-west-2:990155283211:repository/hello-world",
        "registryId": "990155283211",
        "repositoryName": "hello-world",
        "repositoryUri": "990155283211.dkr.ecr.us-west-2.amazonaws.com/hello-world",
        "createdAt": 1551921121.0
    }
}

aws ecr get-login | cmd

docker login https://990155283211.dkr.ecr.us-west-2.amazonaws.com
docker login -u AWS --password-stdin https://990155283211.dkr.ecr.us-west-2.amazonaws.com
eyJwYXlsb2FkIjoiYmVqT0kwSTB3SFE4NUl5WE8xWnZTNGJEVFJndEI1VzR1endidGdoNFlyUUJrR2ZKOUlTNlFkUVAwNFFUd1FrSGpTUzRQV0pUaG1JeFNUSXFTZWxEeSt2RURVNythQ3p0cXJvY3BYMkxzcWlVeW1WUlpqUkFXa25wRldDZXFzTGVKamt2c1dNb05pSUowWUxvdzB0d0FJdElXNVhjRVRwdjc4WmNsdWtzOHZ1STRMRjVLK0srMzBPQ053QjNlSXEzaVFFOFlaY2dNMnFaM0VhaXFCZ2IybDFiTm5rZmtnVHE3c1I4MklHOUlXUmxMSU8yQjBRZ2VhaVVXMUd1UnFnd28zRXRqZzYzMmN3a20rdFArbmlrN0tFbEpIMVFpZUtzRVdzUlN3aGI4WllmSEE2b1FkTHhhMUVVaDErb1lzWm0xVS8xaFlsVC9Jd2pDcWRmUE9zd0xZV2wrNFIyUkJ5MitHRXUxRFRIVERHWnh6dTF6cU90bFZ0N0swRmZuSHR1WWU3RW05THZHbVFVSjNuVzl2QklyUXFlMVpaSWFoM200MGZrWnNod1FMVEVTMjNMWDczSElGa3FETmFlaDE5aGd1REpqY2dRNnNFclpmOVpBdU5wRzdqWjNKQ2VnOWEycGFCVUV3T1RtTnNOVHhWempady82ckI2WG1GNEVCa1pEbEJaSWNiVXVzTTl5VXFqMXJCeGZyKzhnZnk5L2JnRWVrbXlFUEtZMXpPUDRKSitXdUExWWdzZW9iT2w3UUZ2K0xBMzBWWDBwVVNhbzhTRmF5eGs1QWpwN0ZNN0xpS3Z0MUt4aElHaFYxQWpVbFovWWRobnNuWVNTZlRlUExsSjM0RlAzTUg0TTN4cm80ZHB3TXpETDVwUXpHbnhHZWpyazhBSExaVHNCQkU4RXRSdW1pNkcyOXFDRVVHZGlHTWhDaXd5MmpHdytKZHRhQkh1dm5jYlRrbjhMT1d6L2VDY0VXTy9DR005VFdBMlFyVUV1UTRSRWk5MU9NNzl0WmRhNDM4WVd4R01NejNnT1pNcW11eUFWU01vY1VNRGNvTWZMQTgxd2E0QzdPSERNeE1BTGF4YlczQ21yYThUSzY2VU1JdlFnU2sxdGs5RUJXOEtKaDIxNGxPYzl5M25XYWh3dVNPTlNxVjRLNzRCOVdHVGh2NExEbzRQVWZ1TVhObXVndHV6TGVxdFZsU1M0NE9Lak0rUXkwYTFZTmUxTHdaNGRza0dTdjBMSXQ5Y2xFbnZjMDZGMWV6VXBMayt0SFY3UDYzbmNEWVErVDdBRWFXYUZXeFlzaGdsS1ZzOUJ3Q0VMUEVKbUwzQllIMHRlVGhTOUZXdkpqZlhVbWRJTVpnL05Bd2orRHhkK0NKTnEzWW0yZHFyRlFLMm5mU3kvUjhDNFBBZGpYZ0FGVG5NQTlMdGRkRWxTLzZCWFJxNjIwQ1ZsOE9BVzdNN3VBNTVWL2RzcjV2eEZNOHZkaFc5Sm5MWklPaml2NnlWIiwiZGF0YWtleSI6IkFRRUJBSGo2bGM0WElKdy83bG4wSGMwMERNZWs2R0V4SENiWTRSSXBUTUNJNThJblV3QUFBSDR3ZkFZSktvWklodmNOQVFjR29HOHdiUUlCQURCb0Jna3Foa2lHOXcwQkJ3RXdIZ1lKWUlaSUFXVURCQUV1TUJFRURIT09FZGwwQldnMTlJWGIwUUlCRUlBN2ltSEd5bDVsc0gwZzdlMlRaRDQweHA1Q2ZvZWRiNDlBb3pTQUhtSGlTR1NKSG1KSlVydG1mUmorZEFMQk1SVnltbVl2Rk9UdFJMek5seHM9IiwidmVyc2lvbiI6IjIiLCJ0eXBlIjoiREFUQV9LRVkiLCJleHBpcmF0aW9uIjoxNTUxOTY0NzQ2fQ==

