-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8848_319.luac 

-- params : ...
-- function num : 0
if not peattributes.isexe then
  return mp.INFECTED
end
if peattributes.amd64_image then
  (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan_2345pdb")
else
  ;
  (mp.set_mpattribute)("do_exhaustivehstr_rescan_2345pdb")
end
return mp.INFECTED

