-- Threat: !InfrastructureShared
-- Name: 26a9e60c9b40
-- Type: 21

if nri.GetHttpCommand() ~= nri.HTTP_POST then
  return mp.CLEAN
end
local l_0_0 = string.lower(nri.GetHttpRequestHeader("User-Agent"))
if l_0_0 == "winhttp" then
  nri.AddTelemetry(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH))
  return mp.INFECTED
end
return mp.CLEAN
