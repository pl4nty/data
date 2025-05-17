-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\803c_luac 

-- params : ...
-- function num : 0
if peattributes.amd64_image then
  (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan_spector")
else
  ;
  (mp.set_mpattribute)("do_exhaustivehstr_rescan_spector")
end
return mp.INFECTED

