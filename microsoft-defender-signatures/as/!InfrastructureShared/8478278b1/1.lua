-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8478278b1\1.luac 

-- params : ...
-- function num : 0
if not peattributes.isexe then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT < 4 then
  (pe.set_peattribute)("hstr_exhaustive", true)
  ;
  (pe.reemulate)()
end
return mp.CLEAN

