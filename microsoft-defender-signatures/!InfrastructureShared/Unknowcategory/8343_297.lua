-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8343_297.luac 

-- params : ...
-- function num : 0
if epcode[1] == 96 and epcode[2] == 232 and epcode[3] == 0 and epcode[4] == 0 and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN

