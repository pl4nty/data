-- Threat: !InfrastructureShared
-- Name: 5541e5ab071b
-- Type: 21
-- Includes: BMLuaLib

if isnull(this_sigattrlog[2]) or isnull(this_sigattrlog[2].utf8p1) or not isPublicIP(this_sigattrlog[2].utf8p1) then
  return mp.CLEAN
end
local l_0_0 = {
  accept = nri.GetHttpRequestHeader("Accept") or "",
  acceptencoding = nri.GetHttpRequestHeader("Accept-Encoding") or "",
  connection = nri.GetHttpRequestHeader("Connection") or "",
  date = nri.GetHttpRequestHeader("Date") or "",
  dest = this_sigattrlog[2].utf8p1 or "",
  host = nri.GetHttpRequestHeader("Host") or "",
  httpmethod = nri.GetHttpCommand() or "",
  server = nri.GetHttpRequestHeader("Server") or "",
  useragent = nri.GetHttpRequestHeader("User-Agent") or ""
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
