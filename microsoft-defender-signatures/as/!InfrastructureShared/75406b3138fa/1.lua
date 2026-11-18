-- Threat: !InfrastructureShared
-- Name: 75406b3138fa
-- Type: 21

local l_0_0 = {
  accept = nri.GetHttpRequestHeader("Accept") or "",
  acceptencoding = nri.GetHttpRequestHeader("Accept-Encoding") or "",
  connection = nri.GetHttpRequestHeader("Connection") or "",
  date = nri.GetHttpRequestHeader("Date") or "",
  host = nri.GetHttpRequestHeader("Host") or "",
  httpmethod = nri.GetHttpCommand() or "",
  server = nri.GetHttpRequestHeader("Server") or "",
  useragent = nri.GetHttpRequestHeader("User-Agent") or ""
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
