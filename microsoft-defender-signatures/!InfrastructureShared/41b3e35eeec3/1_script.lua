-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41b3e35eeec3\1_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
    local l_0_0 = safeJsonDeserialize((this_sigattrlog[3]).utf8p2)
    if tonumber(l_0_0.append_size) >= 200 and tonumber(l_0_0.append_size) <= 500 then
      reportTimingData()
      ;
      (bm.add_related_string)("file_append_meta", (this_sigattrlog[3]).utf8p2, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

