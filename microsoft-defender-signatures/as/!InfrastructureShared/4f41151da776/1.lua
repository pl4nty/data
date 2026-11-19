-- Threat: !InfrastructureShared
-- Name: 4f41151da776
-- Type: 21

local l_0_0 = nri.GetRawResponseBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if not string.find(l_0_0, "artx-agent", 1, true) then
  return mp.CLEAN
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  stage = "webshell-response-marker"
})
return mp.INFECTED
