-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\175d718ff74ee\0x0000b586_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if #l_0_1 < 1000 then
  return mp.CLEAN
end
if isIEXfound(l_0_1) then
  return mp.INFECTED
end
if (mp.get_mpattribute)("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN

