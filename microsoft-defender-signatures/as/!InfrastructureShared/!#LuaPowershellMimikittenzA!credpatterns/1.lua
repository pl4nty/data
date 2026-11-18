-- Threat: !InfrastructureShared
-- Name: !#Lua:Powershell/Mimikittenz.A!credpatterns
-- Type: 13
-- MpAttributes: Nscript:Type_ps | BM_TEXT_FILE | PowerShell:New-Object

local l_0_0 = 0
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!email") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!webservices") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!accounting") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!social") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!antiforensics") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!remote") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PowerShell/Mimikittenz.A!dev") then
  l_0_0 = l_0_0 + 1
end
if l_0_0 == 1 then
  mp.set_mpattribute("Lua:Powershell/Mimikittenz.A!credpattern")
end
if l_0_0 == 2 then
  mp.set_mpattribute("Lua:Powershell/Mimikittenz.A!credpattern2")
end
if 3 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
