-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb318a76789\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  (bm.add_related_string)("Evidence", (this_sigattrlog[1]).utf8p2, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("Detector", "A", bm.RelatedStringBMReport)
  local l_0_0 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  if l_0_0 and l_0_0.Dll_Path then
    (bm.add_related_file)(l_0_0.Dll_Path)
  else
    return mp.CLEAN
  end
end
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
    (bm.add_related_string)("Evidence", (this_sigattrlog[2]).utf8p2, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("Detector", "B", bm.RelatedStringBMReport)
    local l_0_1 = safeJsonDeserialize((this_sigattrlog[2]).utf8p2)
    if l_0_1 and l_0_1.Dll_Path then
      (bm.add_related_file)(l_0_1.Dll_Path)
    else
      return mp.CLEAN
    end
  end
  do
    return mp.INFECTED
  end
end

