-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb34f06bead\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
    local l_0_0 = safeJsonDeserialize((this_sigattrlog[2]).utf8p2)
    if not isnull(l_0_0) and not isnull(l_0_0.rename_ext) then
      (bm.add_related_string)("gen_ransom_ext_replaced", l_0_0.rename_ext, bm.RelatedStringBMReport)
      reportTimingData()
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

