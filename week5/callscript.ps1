.(Join-Path $PSScriptRoot "GatherClasses.ps1")

clear

#i
#List all the classes of Instructor Furkan Paligu
#$FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | `
#             Where-Object { $_.Instructor -eq "Furkan Paligu" }


#ii
#List all the classes of JOYC 310 on Mondays, only displat Class Code and Times
#Sort by Start time
#$FullTable | Where-Object { ($_.Location -ilike "JOYC 310") -and ($_.days -ilike "Monday") } | `
#             Sort-Object "Time Start" | `
#             Select-Object "Time Start", "Time End", "Class Code"


#iii
#Make a list of all the instructors that teach at least 1 course in
#SYS, SEC, NET, FOR, CSI, DAT
#SORT by name, and make it unique
#$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or `
#                                               ($_."Class Code" -ilike "NET*") -or `
#                                               ($_."Class Code" -ilike "SEC*") -or `
#                                               ($_."Class Code" -ilike "FOR*") -or `
#                                               ($_."Class Code" -ilike "CSI*") -or `
#                                               ($_."Class Code" -ilike "DAT*") } `
#                             | Select-Object "Instructor" `
#                             | Sort-Object "Instructor" -Unique
#$ITSInstructors


#iv
#Group all the instructors by the number of classes they are teaching
$FullTable | Where-Object { $_.Instructor -in $ITSInstructors.Instructor } `
           | Group-Object "Instructor" | Select-Object Count,Name | Sort-Object Count -Descending