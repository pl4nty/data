-- Threat: !InfrastructureShared
-- Name: 175d718ff74ee
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if #l_0_1 < 1000 then
  return mp.CLEAN
end
if isIEXfound(l_0_1) then
  return mp.INFECTED
end
if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
