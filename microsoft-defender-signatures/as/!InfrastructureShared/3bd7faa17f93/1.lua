-- Threat: !InfrastructureShared
-- Name: 3bd7faa17f93
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
l_0_1 = string.match(l_0_3, "echo%s+[%w+/=]+['\"]%s*|%s*base64%s+%-d")
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = MpCommon.Base64Decode(l_0_1)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
if string.find(l_0_0, "request.getparameter", 1, true) and string.find(l_0_0, "runtime.getruntime().exec", 1, true) and string.find(l_0_0, "base64.getdecoder().decode", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
