-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00009f37_luac 

-- params : ...
-- function num : 0
if pehdr.Machine == 332 and not (mp.get_mpattribute)("do_exhaustivehstr_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_rescan")
end
if not (mp.get_mpattribute)("do_exhaustivehstr_64bit_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
end
return mp.CLEAN

