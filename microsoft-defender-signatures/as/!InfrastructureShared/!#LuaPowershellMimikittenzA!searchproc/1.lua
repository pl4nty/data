-- Threat: !InfrastructureShared
-- Name: !#Lua:Powershell/Mimikittenz.A!searchproc
-- Type: 13
-- MpAttributes: Nscript:Type_ps | BM_TEXT_FILE | PowerShell:New-Object

local l_0_0 = 0
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!searchproc_sysinfo") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!searchproc_address") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!searchproc_region") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!searchproc_readmemory") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!searchproc_regexloop") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!searchproc_regexmatch") then
  l_0_0 = l_0_0 + 1
end
if 5 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
