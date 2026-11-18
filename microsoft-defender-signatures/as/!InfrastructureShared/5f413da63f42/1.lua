-- Threat: !InfrastructureShared
-- Name: 5f413da63f42
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if string.find(l_0_1, "exec", 1, true) == nil or string.find(l_0_1, "addnetworkconnector", 1, true) == nil or string.find(l_0_1, "brokerconfig=xbean:http:", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
