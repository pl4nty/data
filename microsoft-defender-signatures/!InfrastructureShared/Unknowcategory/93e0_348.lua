-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93e0_348.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (pesecs[5]).Name == ".reloc" and (pesecs[5]).Characteristics == 1107296320 and (mp.getfilesize)() >= 9000000 and (mp.getfilesize)() <= 15000000 then
  return mp.INFECTED
end
return mp.CLEAN

