-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000b786_luac 

-- params : ...
-- function num : 0
if peattributes.isdll and peattributes.hasexports and (mp.getfilesize)() < 350000 and mp.HSTR_WEIGHT == 1 then
  (mp.set_mpattribute)("do_exhaustivehstr_rescan")
  ;
  (pe.reemulate)()
end
if mp.HSTR_WEIGHT == 2 then
  return mp.INFECTED
end
return mp.CLEAN

