-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3a64070c3\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  ;
  (bm.add_related_string)("AdditionalInfo", l_0_0, bm.RelatedStringBMReport)
  l_0_0 = safeJsonDeserialize(l_0_0)
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = l_0_0.FilesToRemediate
  for l_0_5,l_0_6 in ipairs(l_0_1) do
    (bm.add_related_file)(l_0_6)
  end
end
do
  l_0_0 = mp
  l_0_0 = l_0_0.INFECTED
  return l_0_0
end

