-- Threat: !InfrastructureShared
-- Name: 3dd7b2587572
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
local l_0_2 = string.gsub(l_0_1, "[\"'`^()+#&]", "")
if not contains(l_0_2, {"curl"}) then
  return mp.CLEAN
end
return mp.INFECTED
