-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6fcd_246.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
l_0_0 = (l_0_0.lower)(l_0_0)
if (string.find)(l_0_0, ".lnk", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

