-- Threat: !InfrastructureShared
-- Name: 77d741e90647
-- Type: 21
-- Includes: HstrLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
local l_0_2 = "(windows-defender(-features|-gui)?[^-\\w])"
local l_0_3 = false
l_0_3, _ = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
if l_0_3 == false then
  return mp.CLEAN
end
if not isTamperProtectionOn() then
  return mp.LOWFI
end
return mp.INFECTED
