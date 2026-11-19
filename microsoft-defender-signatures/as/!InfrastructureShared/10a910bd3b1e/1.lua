-- Threat: !InfrastructureShared
-- Name: 10a910bd3b1e
-- Type: 21

local l_0_0 = nri.GetHttpCommand()
local l_0_1 = "verb_" .. tostring(l_0_0)
if l_0_0 == nri.HTTP_GET then
  l_0_1 = "GET"
elseif l_0_0 == nri.HTTP_POST then
  l_0_1 = "POST"
end
local l_0_2 = {
  verb = l_0_1,
  useragent = nri.GetHttpRequestHeader("User-Agent")
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), mp.bitor(nri.Telemetry_QUERY, nri.Telemetry_REFERER)), l_0_2)
return mp.INFECTED
