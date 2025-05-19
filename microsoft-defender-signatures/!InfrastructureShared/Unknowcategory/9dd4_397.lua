-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9dd4_397.luac 

-- params : ...
-- function num : 0
if peattributes.isexe and peattributes.ismsil and peattributes.no_security and (mp.getfilesize)() > 1200000 and (mp.getfilesize)() < 5500000 and (pesecs[2]).Name == ".rsrc" and (pesecs[3]).Name == ".reloc" then
  return mp.INFECTED
end
return mp.CLEAN

