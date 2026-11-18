-- Threat: !InfrastructureShared
-- Name: 584163d970a3
-- Type: 21

if nri.IsResponse() then
  return mp.CLEAN
end
if nri.GetHttpCommand() ~= nri.HTTP_POST then
  return mp.CLEAN
end
local l_0_0 = nri.GetURI()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if not string.find(l_0_0, "/flows", 1, true) then
  return mp.CLEAN
end
local l_0_1 = nri.GetRawRequestBlob()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_4 = string.find(l_0_2, "\"type\"%s*:%s*\"exec\"") ~= nil
local l_0_6 = string.find(l_0_2, "\"type\"%s*:%s*\"inject\"") ~= nil
local l_0_8 = string.find(l_0_2, "\"type\"%s*:%s*\"http in\"") ~= nil
local l_0_10 = string.find(l_0_2, "\"type\"%s*:%s*\"function\"") ~= nil
local l_0_12 = string.find(l_0_2, "\"addpay\"%s*:%s*true") ~= nil
local l_0_14 = l_0_6 and string.find(l_0_2, "base64", 1, true) ~= nil and string.find(l_0_2, "|%s*sh") ~= nil
local l_0_16 = string.find(l_0_2, "wget", 1, true) ~= nil or string.find(l_0_2, "curl", 1, true) ~= nil
local l_0_18 = string.find(l_0_2, "chmod +x", 1, true) ~= nil or string.find(l_0_2, "nohup ", 1, true) ~= nil or string.find(l_0_2, "setsid ", 1, true) ~= nil or string.find(l_0_2, "&& sh", 1, true) ~= nil or string.find(l_0_2, "&& bash", 1, true) ~= nil
local l_0_19 = l_0_6 and l_0_16 and l_0_18
local l_0_20 = l_0_8 and l_0_10 and l_0_12
if not l_0_4 or not l_0_14 and not l_0_19 and not l_0_20 then
  return mp.CLEAN
end
return mp.INFECTED
