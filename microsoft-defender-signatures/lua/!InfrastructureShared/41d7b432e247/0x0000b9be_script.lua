-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41d7b432e247\0x0000b9be_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((mp.GetProcessCommandLine)(l_0_0))
local l_0_2 = "net\\s+use\\s+(?<drive>\\w):\\s+\\\\\\\\\\w{2,5}\\.si@ssl\\\\\\w{1,3}"
local l_0_3 = false
l_0_3 = (MpCommon.StringRegExpSearch)(l_0_2, l_0_1)
if l_0_3 == false then
  return mp.CLEAN
end
return mp.INFECTED

