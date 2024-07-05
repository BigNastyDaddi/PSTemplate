# <#
# .SYNOPSIS
#   Configure-ImmutableBackups.ps1 will be responsible for validating backups have successfully completed, and upload them to the appropriate C3 bucket in AWS. 
# .DESCRIPTION
#   This script does not take parameters and is meant to be executed on a Clario Database server with network connetivity to AWS. The script will validate the backup is 
#   current (today). If there is no backup, the script will not run. Backup failure should be monitored from SQL, if there is an issue with the backup, we will configure the job to
#   alert the appropriate team. Once the backup is validated, our script will then access the S3 bucket and validate the most recent backup. If the backup on the server is newer than
#   the backup on the S3, the replication process will begin to sync the newest backup to the S3 bucket. The script will be run as a chron-job from Windows Task Scheduler. 
# .OUTPUTS
#   Logs files stored in c:\logs\Configure-ImmutableBackups.txt 
# .NOTES
#   Version:        1.00
#   Author:         Ben Burkhead
#   Creation Date:  07-10-2023
#   Purpose/Change: Configure system for Immutable Backup replication
# .EXAMPLE
#   Configure-ImmutableBackups.ps1 
# #>

##XImport essential modules
# Import-Module ActiveDirectory
