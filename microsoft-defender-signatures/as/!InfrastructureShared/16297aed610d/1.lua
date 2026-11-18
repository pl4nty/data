-- Threat: !InfrastructureShared
-- Name: 16297aed610d
-- Type: 21

if not mp.get_mpattribute("InEmail") then
  return mp.CLEAN
end
local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = mp.GetNormalizedScript(l_0_0.is_header):lower()
if l_0_1 == nil or #l_0_1 < 600 then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4, l_0_5 = MpCommon.StringRegExpSearch("\\+([\\w]+)\\((?:\\d+|0x[\\da-f]+)\\)((\\+\\1\\((?:\\d+|0x[\\da-f]+)\\)|\\+'[\\w\\/\\+]+')+)", l_0_1)
if l_0_2 == true and 600 < #l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
