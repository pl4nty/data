-- Threat: !InfrastructureShared
-- Name: 20d758974c3b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if 500 < #l_0_1 then
  return mp.CLEAN
end
if #l_0_1 < 50 then
  return mp.CLEAN
end
if not contains(l_0_1, {"curl"}) then
  return mp.CLEAN
end
if not contains(l_0_1, {"bash", "xattr"}) then
  return mp.CLEAN
end
return mp.INFECTED
