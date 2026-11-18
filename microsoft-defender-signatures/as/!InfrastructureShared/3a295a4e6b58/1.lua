-- Threat: !InfrastructureShared
-- Name: 3a295a4e6b58
-- Type: 21
-- Includes: ResearchData

local l_0_0 = mp.GetBruteMatchData()
if l_0_0.match_offset == 0 then
  return mp.CLEAN
end
local l_0_1 = l_0_0.match_offset
local l_0_2 = 78
if mp.FOOTERPAGE_SZ < l_0_1 + l_0_2 then
  return mp.CLEAN
end
if l_0_0.is_footer then
  local l_0_3 = mp.readfooter(l_0_1, l_0_2):lower()
  local l_0_4 = MpCommon.Base64Encode(l_0_3)
  set_research_data("PDID:C:B", l_0_4, false)
  return mp.INFECTED
end
return mp.CLEAN
