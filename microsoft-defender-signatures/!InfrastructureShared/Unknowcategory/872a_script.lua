-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\872a_luac 

-- params : ...
-- function num : 0
if peattributes.no_security == true and peattributes.isdll == true and (pesecs[3]).Name == ".data" and (pesecs[3]).Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN

