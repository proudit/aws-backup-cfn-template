# AWS Backup CloudFormation Template

## 1. Setting Parameter

* aws-backup.yml

```
  Instances:
    Type: CommaDelimitedList
    Description: Backup Instance List
    Default: arn:aws:ec2:ap-northeast-1:123456789012:instance/i-xxxxxxx,arn:aws:ec2:ap-northeast-1:123456789012:instance/i-xxxxxxx

  NotificationEmail:
    Type: String
    Default: notification@email
    Description: Notification Email

  DeleteAfterDays:
    Type: String
    Default: 4
    Description: Nunber of DeleteAfterDays
    
  StartTime:
    Type: String
    Default: 17
    Description: Backup Start Time (TimeZone = UTC)
```



* Instances
  * The resource ARN to be backed up
    (Separate by commas.)

* NotificationEmail
  * Email address to be notified in case of backup failure

* DeleteAfterDays
  * The number of generations you want to leave behind

* StartTime
  * Time to start the backup, which must be specified in UTC.



## 2.  Deploy

CLI Example

```
 % aws cloudformation deploy --stack-name (StackName) ¥
                             --template-file (StackFileName) ¥
                             --profile (Profile) ¥
                             --region (Region) ¥
                             --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
```

```
 % aws cloudformation deploy --stack-name aws-backup --template-file aws-bakcup.yml --profile default --region ap-northeast-1 --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM

Waiting for changeset to be created..
Waiting for stack create/update to complete
Successfully created/updated stack - aws-backup
```


## License
MIT
