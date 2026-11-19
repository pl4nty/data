-- Threat: !InfrastructureShared
-- Name: 8b410362d782
-- Type: 21

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
if not this_sigattrlog[1].utf8p1 then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
if not string.find(l_0_0, "\\anysign4pc.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1 = {
  useragent = nri.GetHttpRequestHeader("User-Agent")
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_1)
return mp.INFECTED
