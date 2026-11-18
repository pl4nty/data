-- Threat: !InfrastructureShared
-- Name: d14144b99c96
-- Type: 21

local l_0_0 = nri.GetHttpRequestHeader("User-Agent")
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  ["artex-worker/1.0"] = true,
  ["mozilla/5.0 (artex)"] = true,
  ["mozilla/5.0 (compatible; artexverify/1.0)"] = true,
  ["artex-enrich/1.0"] = true,
  ["artex/1.0"] = true,
  scopeweaver = true,
  ["mozilla/5.0 (spa-api-recon)"] = true
}
if not l_0_1[string.lower(l_0_0)] then
  return mp.CLEAN
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  stage = "agent-identification",
  useragent = l_0_0
})
return mp.INFECTED
