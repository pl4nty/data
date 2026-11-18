-- Threat: !InfrastructureShared
-- Name: ddd74d5213a6
-- Type: 21
-- Includes: HstrLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
local l_0_2 = false
l_0_2, _ = MpCommon.StringRegExpSearch("(\\s(stop|delete)\\s(sense|windefend|wdfilter|diagtrack)(\\s|$))", l_0_1)
if l_0_2 == true then
  if not isTamperProtectionOn() then
    return mp.LOWFI
  end
  return mp.INFECTED
end
return mp.CLEAN
