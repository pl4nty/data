-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\875a_306.luac 

-- params : ...
-- function num : 0
if epcode[1] == 235 and epcode[2] == 8 and epcode[3] == 15 and epcode[4] == 98 and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN

