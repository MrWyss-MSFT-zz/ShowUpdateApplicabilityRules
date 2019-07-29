Push-Location $PSScriptRoot
#Create Tools Folder and copy Show-ApplicabilityRule.ps1 into it
$ToolsFolder = New-Item -Path "$($ENV:SMS_ADMIN_UI_PATH)\..\..\XmlStorage\" -Name "Tools" -ItemType "directory" -Force
Copy-Item .\Show-ApplicabilityRule.ps1 $ToolsFolder

#Create GUID Folder and copy ShowApplicabilityRule.xml
$Guids = ("Office_365_Updates", "ef93deea-a0bc-4f36-9b48-a510ac5340eb"),
("All_Software_Updates", "5360fd7a-a1c4-428f-91c9-89a4c5565ce1"),
("All_Windows_10_Updates", "6d833cef-aa77-4018-943c-627979f5905c") | ForEach-Object { [pscustomobject]@{Name = $_[0]; Guid = $_[1] } }


Foreach ($Guid in $Guids) {
    Write-Host "Create Extension for $($Guid.Name)"
    $GuidFolder = New-Item -Path "$($ENV:SMS_ADMIN_UI_PATH)\..\..\XmlStorage\Extensions\Actions" -Name "$($Guid.Guid)" -ItemType "directory" -Force
    if ($($Guid.Name) -eq "All_Windows_10_Updates") {
        Copy-Item .\ShowApplicabilityRule_All_Windows_10_Updates.xml $GuidFolder
    }
    else {
        Copy-Item .\ShowApplicabilityRule.xml $GuidFolder
    }
}