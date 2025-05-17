-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\118789a5f\1_luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 10 then
  return mp.INFECTED
else
  ;
  (mp.set_mpattribute)("do_exhaustivehstr_rescan")
end
return mp.CLEAN

