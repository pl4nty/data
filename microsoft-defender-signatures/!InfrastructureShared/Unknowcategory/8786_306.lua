-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8786_306.luac 

-- params : ...
-- function num : 0
if epcode[1] == 65 and epcode[2] == 85 and epcode[3] == 81 and epcode[4] == 156 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN

