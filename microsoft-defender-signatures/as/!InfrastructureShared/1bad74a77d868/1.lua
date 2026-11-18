-- Threat: !InfrastructureShared
-- Name: 1bad74a77d868
-- Type: 21
-- Includes: ResearchData

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
l_0_1 = string.lower(l_0_1)
local l_0_2 = mp.hstr_full_log()
if l_0_2 ~= nil and l_0_2[9].matched then
  local l_0_3 = "(wmic.*path=([\"']+)?c:?\\\\*\\*?%?([\"']+)?(\\s|$))"
  local l_0_4, l_0_5 = MpCommon.StringRegExpSearch(l_0_3, l_0_1)
  if l_0_4 == true then
    set_research_data("Evidence", MpCommon.Base64Encode(l_0_5), false)
    return mp.INFECTED
  else
    return mp.CLEAN
  end
end
local l_0_6, l_0_7 = MpCommon.StringRegExpSearch("(wmic.*extension=([\"'.*]+)?(exe|dll|bat|ps1)([\"']+)?(\\s|$))", l_0_1)
if l_0_6 == true then
  set_research_data("Evidence", MpCommon.Base64Encode(l_0_7), false)
  return mp.INFECTED
end
return mp.CLEAN
