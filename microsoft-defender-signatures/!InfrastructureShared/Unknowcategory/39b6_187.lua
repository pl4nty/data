-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\39b6_187.luac 

-- params : ...
-- function num : 0
if (pe.get_regval)(pe.REG_ESP) == 1245120 then
  return mp.INFECTED
end
return mp.CLEAN

