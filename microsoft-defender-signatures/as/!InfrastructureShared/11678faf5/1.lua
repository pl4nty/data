-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11678faf5\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 6 then
  return mp.INFECTED
end
if not (mp.get_mpattribute)("do_exhaustivehstr_rescan") then
  (mp.set_mpattribute)("do_exhaustivehstr_rescan")
  ;
  (pe.reemulate)()
end
return mp.LOWFI

