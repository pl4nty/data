-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\86c0_300.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true or peattributes.isdll == true and (pesecs[6]).Name == ".edata" and (pesecs[6]).Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN

