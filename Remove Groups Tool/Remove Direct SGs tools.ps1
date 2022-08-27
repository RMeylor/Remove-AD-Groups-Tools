##prompt asking the user to input the Pre2k for the desired user
$Pre2k = Read-host -prompt "Please enter the seperated Employee's Pre2k"

##this will look up the user in AD
##$Data stores the list og groups the user is in
$Data = Get-ADPrincipalGroupMembership $Pre2K | select name, GroupScope, GroupCategory

##This loop will then iterate through the user's assign groups
    ##These nested loops should prevent SGs and JTs from being removed
    ##The same idea can be implimented for LGs or could be done with OR statements 
for($i = 0; $i -lt $Data.count; $i++){
    if($Data -contains "SG"){
        ""
        }
        else {if ($Data -contains "JT") {
                ""
                }
                    else {Remove-ADGroupMember -Identity $Data[$i].name -Members $pre2k}
             } 
}