-- Threat: !InfrastructureShared
-- Name: 379d779d21e7c
-- Type: 21
-- Includes: ResearchData

local l_0_0, l_0_1 = MpCommon.NidSearch(mp.NID_ENABLE_EXTENDED_BAFS, 6)
if l_0_0 == true and l_0_1 == "#E5EmergencyAntiTampering" then
  set_research_data("E5EmergencyAntiTampering", "true", false)
end
if MpCommon.NidSearch(mp.NID_ENABLE_EXTENDED_BAFS, 3) then
  set_research_data("AggressivePeTrigger", "true", false)
end
return mp.INFECTED
