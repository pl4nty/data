-- Threat: !InfrastructureShared
-- Name: b9b321c51bb2
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

add_parents()
reportSessionInformationInclusive()
local l_0_0 = reportRelevantUntrustedEntities(0)
if l_0_0 and next(l_0_0) then
  bm.add_related_string("HasUntrustedEntities", "true", bm.RelatedStringBMReport)
  bm.add_related_string("UntrustedEntities", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
end
local l_0_1 = add_parents()
local l_0_2 = {}
for l_0_3, l_0_4 in ipairs(l_0_1) do
  local l_0_5 = l_0_4:match("([^\\]+)$")
  table.insert(l_0_2, l_0_5)
end
local l_0_6 = GetRollingQueue("NewlyRegisteredServices")
if l_0_6 then
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    if contains(l_0_8, l_0_2) then
      bm.add_related_string("RegisteredSrv", l_0_8, bm.RelatedStringBMReport)
      break
    end
  end
end
return mp.INFECTED
