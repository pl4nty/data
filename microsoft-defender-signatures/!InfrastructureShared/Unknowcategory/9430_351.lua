-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9430_351.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
end
if peattributes.amd64_image then
  (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan_minipopups")
else
  ;
  (mp.set_mpattribute)("do_exhaustivehstr_rescan_minipopups")
end
return mp.CLEAN

