-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93c6_345.luac 

-- params : ...
-- function num : 0
if peattributes.no_security == true and peattributes.isexe == true and (pesecs[6]).Name == ".symtab" and (pesecs[3]).Characteristics == 3221225536 and (pesecs[4]).Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN

