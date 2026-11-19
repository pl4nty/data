-- Threat: !InfrastructureShared
-- Name: 12e41ae9c0f4c
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.gsub(l_0_0, "%+", " ")
l_0_1 = string.gsub(l_0_1, "%%(%x%x)", function(l_1_0)
  return string.char(tonumber(l_1_0, 16))
end)
l_0_1 = string.lower(l_0_1)
if not string.find(l_0_1, "requestedsecuritytoken", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "<[%w]*:?cookie[^>]*>%s*([a-z0-9+/=]+)%s*</[%w]*:?cookie>")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  campaign = "CVE-2026-50522",
  product = "SharePoint"
}
nri.AddTelemetry(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), l_0_3)
return mp.INFECTED
