##prompt asking the user to input the Pre2k for the desired user
$Pre2k = Read-host -prompt "Please enter the seperated Employee's Pre2k"
##this will look up the user in AD
##$Data stores the list og groups the user is in
$Data = Get-ADPrincipalGroupMembership $Pre2K | select name, GroupScope, GroupCategory

##This loop will then iterate through the user's groups and remove them from each group
    ##This should work for JTs, RGs, 
for($i = 0; $i -lt $Data.count; $i++){
Remove-ADGroupMember -Identity $Data[$i].name -Members $pre2k
}