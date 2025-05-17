-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93a4_luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (pesecs[6]).Name == ".reloc" and (pesecs[6]).Characteristics == 1107296320 and (mp.getfilesize)() >= 7300000 and (mp.getfilesize)() <= 8500000 then
  return mp.INFECTED
end
return mp.CLEAN

