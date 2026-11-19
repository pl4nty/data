-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell/PowerView.A
-- Type: 13
-- MpAttributes: SCRIPT:PowerShell & (SCRIPT:PowerSploitFile | PowerShell:New-Object)

local l_0_0 = 0
if mp.get_mpattribute("SCRIPT:PowerShell/Invoke-CheckLocalAdminAccess") or mp.get_mpattribute("TEL:SCPT_LCSuspiPSPattern68") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Invoke-ThreadedFunction") or mp.get_mpattribute("TEL:SCPT_LCSuspiPSPattern169") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Find-LocalAdminAccess") or mp.get_mpattribute("TEL:SCPT_LCSuspiPSPattern24") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Get-ExploitableSystem") or mp.get_mpattribute("TEL:SCPT_LCSuspiPSPattern209") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Invoke-ThreadedFunction") or mp.get_mpattribute("TEL:SCPT_LCSuspiPSPattern169") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("TEL:SCPT_LCSuspiPSPattern150") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("TEL:SCPT_LCSuspiPSPattern45") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT_HCSuspiPSPattern") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("TEL:SCPT_LCSuspiPSPattern143") then
  l_0_0 = l_0_0 + 1
end
if 4 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
