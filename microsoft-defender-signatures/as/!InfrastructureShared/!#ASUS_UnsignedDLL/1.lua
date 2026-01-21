-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ASUS_UnsignedDLL\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "loc.dll", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

