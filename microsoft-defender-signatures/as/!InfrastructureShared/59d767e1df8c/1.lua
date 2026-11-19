-- Threat: !InfrastructureShared
-- Name: 59d767e1df8c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {"V_E_R_I_F"}
if contains(l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.LOWFI
