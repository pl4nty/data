-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a07d_408.luac 

-- params : ...
-- function num : 0
if peattributes.isdll and not (mp.get_mpattribute)("PEPCODE:HasDigitalSignature") and (mp.getfilesize)() >= 500000 and (mp.getfilesize)() <= 2000000 and not (mp.get_mpattribute)("do_exhaustivehstr_64bit_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
  return mp.INFECTED
end
return mp.CLEAN

