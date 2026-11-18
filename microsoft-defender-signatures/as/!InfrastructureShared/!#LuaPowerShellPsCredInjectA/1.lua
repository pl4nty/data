-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell/PsCredInject.A
-- Type: 13
-- MpAttributes: SCRIPT:PowerShell & PowerShell:New-Object

local l_0_0 = 0
if mp.get_mpattribute("SCRIPT:RefPeInject.A") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PsCredInject.A!NewWinLogonA") or mp.get_mpattribute("SCRIPT:PsCredInject.A!NewWinLogonB") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PsCredInject.A!ExistingWinLogon") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PsCredInject.A!Binary") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PsCredInject.A!BinaryDecode") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCRIPT:PsCredInject.A!BinaryInject") then
  l_0_0 = l_0_0 + 1
end
if 2 <= l_0_0 then
  mp.set_mpattribute("Lua:PowerShell/PsCredInject.A!suspicious")
end
if 4 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
