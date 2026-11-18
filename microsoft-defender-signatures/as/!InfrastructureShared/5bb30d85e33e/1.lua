-- Threat: !InfrastructureShared
-- Name: 5bb30d85e33e
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = RansomwareFeatures()
if l_0_0 == nil or type(l_0_0) ~= "table" or #l_0_0 ~= 7 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = ""
for l_0_3 = 1, #l_0_0 do
  l_0_2 = string.match(l_0_0[l_0_3], "[^=]+$")
  if l_0_2 == "true" then
    l_0_1 = l_0_1 + 1
  end
end
if 4 <= l_0_1 then
  bm.add_related_string("RansomwareFeaturesData", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
  reportSessionInformationInclusive()
  sms_untrusted_process()
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
