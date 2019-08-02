$Schedule = New-Object -ComObject "Schedule.Service"
$Schedule.Connect()
$Folder = $Schedule.GetFolder('\')
$Folder.GetTasks(1) | Select Name,Path,State
