-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93c4_346.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (pesecs[9]).Name == ".tls" and (pesecs[9]).Characteristics == 3221225536 and (mp.getfilesize)() >= 1000000 and (mp.getfilesize)() <= 3000000 then
  return mp.INFECTED
end
return mp.CLEAN

