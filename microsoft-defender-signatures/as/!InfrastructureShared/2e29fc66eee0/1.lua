-- Threat: !InfrastructureShared
-- Name: 2e29fc66eee0
-- Type: 21

local l_0_0, l_0_1, l_0_2
l_0_0 = tostring(headerpage)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_1 = string.match(l_0_0, "%/Command%/Base64%/(.*)\"?'?}")
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_2 = MpCommon.Base64Decode(l_0_1)
if l_0_2 ~= nil and (string.find(l_0_2, "wget", 1, true) or string.find(l_0_2, "powershell", 1, true) or string.find(l_0_2, "python", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
