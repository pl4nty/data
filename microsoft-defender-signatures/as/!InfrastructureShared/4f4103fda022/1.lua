-- Threat: !InfrastructureShared
-- Name: 4f4103fda022
-- Type: 21

local l_0_0 = nri.GetHttpRequestHeader("X-ARTX-KEY")
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 == "" then
  return mp.CLEAN
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  stage = "webshell-request-header"
})
return mp.INFECTED
