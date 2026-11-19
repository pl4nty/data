-- Threat: !InfrastructureShared
-- Name: 4a416484d0e3
-- Type: 21

local l_0_0 = nri.GetURI()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if not string.find(l_0_0, "sig=", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_0, "sv=", 1, true) then
  return mp.CLEAN
end
local l_0_1 = nri.GetHttpRequestHeader("x-ms-meta-signature")
local l_0_2 = nri.GetHttpRequestHeader("x-ms-meta-hash")
if l_0_1 ~= nil and l_0_2 ~= nil then
  local l_0_3 = {}
  local l_0_4 = nri.GetHttpRequestHeader("x-ms-meta-stat")
  if l_0_4 then
    l_0_3.stat = l_0_4
  end
  nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_3)
  return mp.INFECTED
end
local l_0_5 = nri.GetHttpRequestHeader("x-ms-blob-type")
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = {
  blob_url_frag = string.sub(l_0_0, 1, 200)
}
nri.AddTelemetry(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), l_0_6)
return mp.INFECTED
