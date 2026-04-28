-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3a3ef8c4b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRollingQueue("memRegionsMetadata")
if not l_0_0 or type(l_0_0) ~= "table" then
  return mp.CLEAN
end
for l_0_4,l_0_5 in ipairs(l_0_0) do
  if l_0_5.key == "data" and l_0_5.value then
    (bm.add_related_string)("memRegionsMetadata", l_0_5.value, bm.RelatedStringBMReport)
  end
end
return mp.INFECTED

