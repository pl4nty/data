-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1cfd7fd8691a1\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
local l_0_2 = nil
if (mp.GetScannedPPID)() == nil then
  return mp.CLEAN
end
local l_0_3 = nil
if (mp.GetProcessCommandLine)((mp.GetScannedPPID)()) == nil or #(mp.GetProcessCommandLine)((mp.GetScannedPPID)()) <= 10 then
  return mp.CLEAN
end
l_0_3 = (string.match)((mp.GetProcessCommandLine)((mp.GetScannedPPID)()), "%s%-enc%s+([A-Za-z0-9+/]+=*)")
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_2 = (MpCommon.Base64Decode)(l_0_3)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (string.gsub)(l_0_2, "%z", "")
l_0_2 = l_0_2:lower()
local l_0_4 = nil
if contains(l_0_2, {"/%?subid=%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x%-%-%-%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x"}, false) then
  return mp.INFECTED
end
return mp.CLEAN

