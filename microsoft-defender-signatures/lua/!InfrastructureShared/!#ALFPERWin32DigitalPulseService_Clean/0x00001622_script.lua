-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERWin32DigitalPulseService_Clean\0x00001622_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.getfilename)())
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if (string.sub)(l_0_2, 1, 9) == "dpservice" then
  return mp.INFECTED
end
return mp.CLEAN

