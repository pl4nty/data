-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\49780b465\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 3 then
  (mp.set_mpattribute)("do_exhaustivehstr_rescan")
  return mp.SUSPICIOUS
end
if mp.HSTR_WEIGHT >= 2 then
  return mp.LOWFI
end
return mp.CLEAN

