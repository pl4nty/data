-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9f785fa68\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 6 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 4 then
  (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
end
return mp.CLEAN

