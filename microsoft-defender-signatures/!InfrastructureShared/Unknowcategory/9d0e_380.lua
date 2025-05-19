-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9d0e_380.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and peattributes.hasexports == true and (pesecs[3]).Name == ".cdata" and (pesecs[3]).Characteristics == 3221225536 and (mp.getfilesize)() >= 10000000 and (mp.getfilesize)() <= 15000000 then
  return mp.INFECTED
end
return mp.CLEAN

