-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9063_337.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and peattributes.ismsil == true and (pesecs[2]).Name == ".rsrc" and (pesecs[3]).Name == ".reloc" and (mp.getfilesize)() > 500000 then
  return mp.INFECTED
end
return mp.CLEAN

