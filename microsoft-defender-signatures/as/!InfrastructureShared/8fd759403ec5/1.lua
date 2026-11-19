-- Threat: !InfrastructureShared
-- Name: 8fd759403ec5
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = mp.GetScannedPPID()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 or #l_0_3 <= 10 then
  return mp.CLEAN
end
l_0_1 = string.match(l_0_3, "::FromBase64String[%\"%'%( ]+([%w+/=]+)")
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = MpCommon.Base64Decode(l_0_1)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
if not string.find(l_0_0, "iwr%s*%(?['\"]?https?://") and not string.find(l_0_0, "invoke%-webrequest%s*%(?['\"]?https?://") then
  return mp.CLEAN
end
return mp.INFECTED
