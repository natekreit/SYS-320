.(Join-Path $PSScriptRoot "GatherClasses.ps1")

clear

#i
#List all the classes of Instructor Furkan Paligu
#$FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | `
#             Where-Object { $_.Instructor -eq "Furkan Paligu" }


#ii
#List all the classes of JOYC 310 on Mondays, only displat Class Code and Times
#Sort by Start time
$FullTable | Where-Object { ($_.Location -ilike "JOYC 310") -and ($_.days -ilike "Monday") } | `
             Sort-Object "Time Start