-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000222_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched then
  if (this_sigattrlog[1]).utf8p1 ~= nil then
    (bm.add_related_string)("RenameFileSource", (this_sigattrlog[1]).utf8p1, bm.RelatedStringBMReport)
  end
  if (this_sigattrlog[1]).utf8p2 ~= nil then
    (bm.add_related_file)((this_sigattrlog[1]).utf8p2)
  end
end
return mp.INFECTED

