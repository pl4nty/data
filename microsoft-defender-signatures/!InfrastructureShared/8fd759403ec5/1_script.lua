-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8fd759403ec5\1_luac 

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
l_0_3 = (string.match)((mp.GetProcessCommandLine)((mp.GetScannedPPID)()), "::FromBase64String[%\"%\'%( ]+([%w+/=]+)")
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_2 = (MpCommon.Base64Decode)(l_0_3)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:lower()
if not (string.find)(l_0_2, "iwr%s*%(?[\'\"]?https?://") and not (string.find)(l_0_2, "invoke%-webrequest%s*%(?[\'\"]?https?://") then
  return mp.CLEAN
end
return mp.INFECTED

