-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\74f7_261.luac 

-- params : ...
-- function num : 0
if epcode[1] == 139 and epcode[2] == 255 and epcode[3] == 200 and epcode[4] == 128 then
  return mp.INFECTED
end
return mp.CLEAN

