-- Threat: !InfrastructureShared
-- Name: 15401f455d6d
-- Type: 21

local l_0_0 = nri.GetHttpCommand()
local l_0_1 = {
  [nri.HTTP_POST] = "POST",
  [nri.HTTP_GET] = "GET",
  [nri.HTTP_PUT] = "PUT",
  [nri.HTTP_DELETE] = "DELETE"
}
local l_0_2 = l_0_1[l_0_0] or "UNKNOWN"
local l_0_3 = {
  useragent = nri.GetHttpRequestHeader("User-Agent"),
  method = l_0_2
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_3)
return mp.INFECTED
