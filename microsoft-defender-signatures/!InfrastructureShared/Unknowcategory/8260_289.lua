-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8260_289.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 >= 12000 and l_0_0 <= 17096 and (mp.get_mpattribute)("pea_no_security") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

