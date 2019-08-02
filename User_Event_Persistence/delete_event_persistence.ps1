# create Task Scheduler COM object
$TS = New-Object -ComObject Schedule.Service
# connect to local task sceduler
$TS.Connect()
# get tasks folder (in this case, the root of Task Scheduler Library)
$TaskFolder = $TS.GetFolder("\")
# get tasks in folder
$Tasks = $TaskFolder.GetTasks(1)
# define name of task to delete
$TaskToDelete = "Windows Perflogs"
# step through all tasks in the folder
foreach($Task in $Tasks){
    if($Task.Name -eq $TaskToDelete){
        Write-Host ("Task "+$Task.Name+" will be removed")
        $TaskFolder.DeleteTask($Task.Name,0)
    }
}
