param([string]$rootdomain = "root",[string]$netbios="netbios", [string]$windows_ssh_pass="password")


Import-Module ADDSDeployment 

Install-ADDSForest -DomainName $rootdomain -DomainNetbiosName $netbios -safemodeadministratorpassword (convertto-securestring $windows_ssh_pass -asplaintext -force) -Force:$true

#-OtherAttributes  @{'sun-fm-saml2-nameid-infokey'= $sunfmsaml2nameidinfokey; 'sun-fm-saml2-nameid-info'=$sunfmsaml2nameidinfo}
# Removed until finding a way of automatically loading the fr schema into AD