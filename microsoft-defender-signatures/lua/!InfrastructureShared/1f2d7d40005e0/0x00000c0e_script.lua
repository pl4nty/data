-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f2d7d40005e0\0x00000c0e_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ((mp.GetProcessCommandLine)(l_0_0)):lower()
if isIEXfound(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

