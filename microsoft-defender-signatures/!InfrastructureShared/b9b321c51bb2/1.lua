-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b9b321c51bb2\1.luac 

-- params : ...
-- function num : 0
add_parents()
reportSessionInformationInclusive()
local l_0_0 = reportRelevantUntrustedEntities(0)
if l_0_0 and next(l_0_0) then
  (bm.add_related_string)("HasUntrustedEntities", "true", bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
end
local l_0_1 = add_parents()
local l_0_2 = {}
for l_0_6,l_0_7 in ipairs(l_0_1) do
  local l_0_8 = l_0_7:match("([^\\]+)$")
  ;
  (table.insert)(l_0_2, l_0_8)
end
local l_0_9 = GetRollingQueue("NewlyRegisteredServices")
if l_0_9 then
  for l_0_13,l_0_14 in ipairs(l_0_9) do
    if contains(l_0_14, l_0_2) then
      (bm.add_related_string)("RegisteredSrv", l_0_14, bm.RelatedStringBMReport)
      break
    end
  end
end
do
  return mp.INFECTED
end

