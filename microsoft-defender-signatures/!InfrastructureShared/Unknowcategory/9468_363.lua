-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9468_363.luac 

-- params : ...
-- function num : 0
if epcode[1] == 246 and epcode[2] == 195 and epcode[3] == 1 and epcode[4] == 116 and peattributes.isexe and (mp.get_mpattribute)("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN

