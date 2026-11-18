-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Powershell/PSKeyloggerWindowHook.A
-- Type: 24
-- MpAttributes: SCPT:SetWindowsHookExCall

local l_0_0 = mp.enum_mpattributesubstring("SCPT:KeyloggerWindowHook")
if 3 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
