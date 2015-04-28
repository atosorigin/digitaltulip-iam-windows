param([string]$rootdomain = "root",[string]$netbios="netbios", [string]$windows_ssh_pass="password")


Import-Module ADDSDeployment 

Install-ADDSForest -DomainName $rootdomain -DomainNetbiosName $netbios -safemodeadministratorpassword (convertto-securestring $windows_ssh_pass -asplaintext -force) -Force:$true

