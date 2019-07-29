
# Show Update Applicabilty Rule

# Introduction

Windows Updates have Applicability Rules, that decide whether an update is installable or is installed. This information can be very useful in Troubleshooting cases and to understand why a updates report back installed or why a updates is not installing.
These Rules are defined in the Update.xml per Update. The Update.xml is stored in the WSUS Update Database in the RootElementXmlCompressed filed of the table tbxml. An update can be bundled. Therefore the bundled update xml needs to be looked at.
Show-ApplicabilityRule.ps1 will help you to extract the Applicability Rule.

## Script Stand alone

![Alt text](res/script.gif "Script Standalone")

```powershell
.\Show-ApplicabilityRule.ps1 -SQLServer sql1.ifish.local -SQLDBName SUSDB -UpdateSearchString "%Office 365 Client Update - First Release for Current Channel Version 1706 for x64 based Edition (Build 8229.2056)%"
```

## SCCM Console Extension installation

![Alt text](res/sccm_extension.gif "SCCM Extension")

* Copy all xml's and ps1's to a folder on the machine where you have the console installed
* Change edit the line with admin console path sql server fqdn and db name in ShowApplicabilityRule.xml and ShowApplicabilityRule_All_Windows_10_Updates.xml
* Run install.ps1 script as an admin
* Restart the Console

## SCCM Console Extension uninstallation

```powershell
Get-ChildItem -Path "$($ENV:SMS_ADMIN_UI_PATH)\..\..\XmlStorage\Extensions\Actions" -Recurse -Filter "ShowApplicabilityRule*.xml" | Remove-Item 
Get-ChildItem -Path "$($ENV:SMS_ADMIN_UI_PATH)\..\..\XmlStorage\Tools" -Recurse -Filter "Show-ApplicabilityRule.ps1" | Remove-Item
```

# TODO

- [ ] replace temp file workaround in powershell script
- [x] uninstallation routine script
- [ ] Autdetection of SUS SQL and DB
- [x] Test with WID (Windows Internal Database)
- [ ] Test in Multi SUS Environment
- [x] Better view of the Applicability Rule
- [x] SQL Command Error Handling

# Contribute

Let me know, create issues or PR's
