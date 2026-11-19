-- Threat: !InfrastructureShared
-- Name: 32b3678f38fe
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = "http://b1566530-7dcc-4568-a501-3ca8bb16c014.info"
local l_0_1 = {
  [1] = l_0_0
}
local l_0_2 = {
  SIG_CONTEXT = "BM",
  CONTENT_SOURCE = "AdaptiveTP_TamperingGen",
  TAG = "NOLOOKUP"
}
local l_0_3, l_0_4 = pcall(mp.GetUrlReputation, l_0_1, l_0_2)
if not (l_0_3 and l_0_4) or not l_0_4.urls then
  bm.add_related_string("CloudAdvice", "empty", bm.RelatedStringBMReport)
end
for l_0_5, l_0_6 in ipairs(l_0_4.urls) do
  if l_0_6.determination == 4 then
    bm.add_related_string("CloudAdvice", safeJsonSerialize(l_0_6), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
