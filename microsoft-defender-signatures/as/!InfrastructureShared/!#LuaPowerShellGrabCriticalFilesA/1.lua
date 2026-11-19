-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell/GrabCriticalFiles.A
-- Type: 13
-- MpAttributes: SCRIPT:PsUserProfileListFiles.A

local l_0_0 = 0
if mp.get_mpattribute("SCRIPT:StringCredentialSubstring") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:StringFileExtensionOffice") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:StringFileExtensionArchive") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:StringFileExtensionImage") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:StringFileExtensionAdobe") then
  l_0_0 = l_0_0 + 1
end
if l_0_0 == 5 then
  return mp.INFECTED
end
if 2 <= l_0_0 then
  mp.set_mpattribute("Lua:PowerShell/GrabCriticalFiles.B")
end
return mp.CLEAN
