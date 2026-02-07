-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7fd7480a1c66\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
local l_0_2 = nil
if not (mp.GetScannedPPID)() then
  return mp.CLEAN
end
local l_0_3 = nil
if not (mp.GetProcessCommandLine)((mp.GetScannedPPID)()) or #(mp.GetProcessCommandLine)((mp.GetScannedPPID)()) <= 10 then
  return mp.CLEAN
end
l_0_3 = (string.match)((mp.GetProcessCommandLine)((mp.GetScannedPPID)()), "echo%s+[\'\"]?([A-Za-z0-9/%+=]+)[\'\"]?")
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_2 = (MpCommon.Base64Decode)(l_0_3)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:lower()
local l_0_4 = nil
if contains(l_0_2, {"91.92.242.30", "95.92.242.30", "96.92.242.30", "202.161.50.59", "54.91.154.110"}) then
  return mp.INFECTED
end
return mp.CLEAN

