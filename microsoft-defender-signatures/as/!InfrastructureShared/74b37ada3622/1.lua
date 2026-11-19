-- Threat: !InfrastructureShared
-- Name: 74b37ada3622
-- Type: 21

local l_0_0 = MpCommon.AnomalyEventLookup("powtrack", "POWTRACKTDSC|", 1)
local l_0_1
local l_0_2 = 0
if l_0_0 == nil then
  l_0_1 = this_sigattrlog[3].timestamp
  MpCommon.AnomalyEventUpdate("powtrack", "POWTRACKTDSC|", 1, 1)
else
  l_0_1 = l_0_0.LastSeen
  l_0_2 = l_0_0.UnbiasedTime
end
local l_0_3 = bm.get_imagepath()
l_0_0 = MpCommon.AnomalyEventLookup("powtrack", l_0_3, 1)
local l_0_4 = 1
if l_0_0 ~= nil then
  l_0_4 = l_0_0.Count + 1
else
  local l_0_5 = this_sigattrlog[3].timestamp
  if l_0_1 < l_0_5 then
    if 26784000000000 < l_0_5 - l_0_1 then
      mp.ReportLowfi(l_0_3, 1888262118)
    end
    if 6000 < l_0_2 then
      mp.ReportLowfi(l_0_3, 2177800794)
    end
  end
end
MpCommon.AnomalyEventUpdate("powtrack", l_0_3, l_0_4, 1)
return mp.CLEAN
