-- Threat: Trojan:PowerShell/ClickFixObfus.C
-- Type: 13
-- MpAttributes: ALF:Trojan:Script/ClickFix.A & MpPowershellAmsiViaCmdLine

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "curl", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
