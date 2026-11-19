-- Threat: !InfrastructureShared
-- Name: 5941391ccb29
-- Type: 21

local l_0_0 = nri.GetConnectionString()
local l_0_1 = string.match(l_0_0, "SrcIp=(.-)%.")
local l_0_2 = string.match(l_0_0, "DestIp=(.-)%.")
if l_0_1 == l_0_2 then
  return mp.CLEAN
end
if this_sigattrlog[1].timestamp > this_sigattrlog[2].timestamp then
  return mp.CLEAN
end
local l_0_3 = this_sigattrlog[2].timestamp - this_sigattrlog[1].timestamp
if 300000000 < l_0_3 then
  return mp.CLEAN
end
local l_0_4 = {
  useragent = nri.GetHttpRequestHeader("User-Agent")
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_4)
return mp.INFECTED
