-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell/LnkWithEmbeddedPSEncHidden.A
-- Type: 24
-- MpAttributes: RPF:PowershellInLnk

mp.UfsSetMetadataBool("LnkWithPowerShellCmd", true)
return mp.CLEAN
