param([string]$firstname = "",[string]$surname="", [string]$email="",  [string]$idpfqdn="", [string]$initialpassword="")

Import-Module activedirectory

$Displayname = $firstname + " " + $surname            
$SamAccountName    = $firstname.ToLower() + "." + $surname.ToLower()           
$UserPrincipalName = $email  
$sunfmsaml2nameidinfokey  = "https://" + $idpfqdn + "/openam|urn:federation:MicrosoftOnline|" +  $SamAccountName
$sunfmsaml2nameidinfo  = "https://" + $idpfqdn +  "/openam|urn:federation:MicrosoftOnline|" + $SamAccountName + "|https://" + $idpfqdn + "/openam|urn:oasis:names:tc:SAML:2.0:nameid-format:persistent|"  +  $SamAccountName + "|urn:federation:MicrosoftOnline|IDPRole|false"

$setpass = ConvertTo-SecureString -AsPlainText $initialpassword -force  

New-ADUser -Name $Displayname -DisplayName $Displayname -SamAccountName $SamAccountName -GivenName $firstname -Surname $surname -EmailAddress $email -UserPrincipalName $UserPrincipalName -OtherAttributes  @{'sun-fm-saml2-nameid-infokey'= $sunfmsaml2nameidinfokey; 'sun-fm-saml2-nameid-info'=$sunfmsaml2nameidinfo} -AccountPassword $setpass -Enabled 1 -ChangePasswordAtLogon 0 -PasswordNeverExpires 1