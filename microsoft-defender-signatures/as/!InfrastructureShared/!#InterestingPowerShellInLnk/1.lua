-- Threat: !InfrastructureShared
-- Name: !#InterestingPowerShellInLnk
-- Type: 13
-- MpAttributes: SCRIPT:PowerShell & BM_LNK_FILE

mp.UfsSetMetadataBool("Lua:PowerShellInLnk", true)
return mp.CLEAN
