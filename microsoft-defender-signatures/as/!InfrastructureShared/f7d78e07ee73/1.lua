-- Threat: !InfrastructureShared
-- Name: f7d78e07ee73
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = mp.GetParentProcInfo(l_0_0)
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
local l_0_3 = {".bat"}
if contains(l_0_2, l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
