-- Threat: !InfrastructureShared
-- Name: 2ca9ba475205
-- Type: 21

local l_0_0 = string.lower(nri.GetHttpRequestHeader("referer"))
if string.find(l_0_0, "live.com", 1, true) or string.find(l_0_0, "bing.com", 1, true) or string.find(l_0_0, "msn.com", 1, true) or string.find(l_0_0, "yahoo.com", 1, true) or string.find(l_0_0, "windowssearch.com", 1, true) or string.find(l_0_0, "conduit.com", 1, true) then
  return mp.CLEAN
end
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), mp.bitor(nri.Telemetry_QUERY, nri.Telemetry_REFERER)))
return mp.INFECTED
