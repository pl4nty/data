-- Threat: !InfrastructureShared
-- Name: 6b3b3e7293e21
-- Type: 21

local l_0_0
if this_sigattrlog[30].matched then
  l_0_0 = string.lower(this_sigattrlog[30].utf8p1)
  l_0_0 = l_0_0:match("(%w+%.exe)$")
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1 = "|werfault.exe|werfaultsecure.exe|wermgr.exe|"
  if l_0_1:find(l_0_0, 1, true) ~= nil then
    return mp.CLEAN
  end
end
local l_0_2 = MpCommon.GetCurrentTimeT()
local l_0_3 = MpCommon.AnomalyEventLookup("Svchost_ChildProcs", "InitializationTime", 1)
if l_0_3 == nil then
  l_0_3 = l_0_2
end
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = (l_0_2 - l_0_3.Count) / 60
local l_0_6 = l_0_4 <= 10080
local l_0_7 = MpCommon.AnomalyEventLookup("Svchost_ChildProcs", l_0_0, 1)
if l_0_7 == nil then
  if l_0_6 then
    return mp.CLEAN
  end
  bm.add_related_string("Initialization_Time", l_0_3, bm.RelatedStringBMReport)
  bm.add_related_string("Minutes_Elapsed", l_0_4, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
