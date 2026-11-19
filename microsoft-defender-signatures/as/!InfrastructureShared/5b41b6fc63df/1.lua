-- Threat: !InfrastructureShared
-- Name: 5b41b6fc63df
-- Type: 21

local l_0_0 = nri.GetHttpRequestHeader("x-ms-meta-hash")
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = nri.GetHttpRequestHeader("x-ms-meta-stat")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = nri.GetHttpRequestHeader("x-ms-meta-link")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {stat = l_0_1, link = l_0_2}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_3)
return mp.INFECTED
