-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7009_249.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and ((pe.get_exports_count)() == 11 or (pe.get_exports_count)() == 31) then
  return mp.INFECTED
end
return mp.CLEAN

