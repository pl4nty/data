-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b316025548\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  (bm.add_related_string)("Evidence", (this_sigattrlog[1]).utf8p2, bm.RelatedStringBMReport)
  local l_0_0 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  if l_0_0 and l_0_0.Dll_Path then
    (bm.add_related_file)(l_0_0.Dll_Path)
  end
end
do
  return mp.INFECTED
end

