-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9fa7_406.luac 

-- params : ...
-- function num : 0
if epcode[1] == 83 and epcode[2] == 85 and epcode[3] == 187 and epcode[4] == 149 and epcode[5] == 31 and peattributes.isexe and (mp.get_mpattribute)("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN

