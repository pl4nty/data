-- Threat: !InfrastructureShared
-- Name: 6e410b9d67dd
-- Type: 21

if nri.IsResponse() then
  return mp.CLEAN
end
if nri.GetHttpCommand() ~= nri.HTTP_POST then
  return mp.CLEAN
end
local l_0_0 = nri.GetRawRequestBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.find(l_0_0, "access_token=http://", 1, true) or string.find(l_0_0, "access_token=https://", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
if not string.find(l_0_0, "&debug=", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {
  campaign = "Remus",
  protocol = "access_token_debug"
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_2)
return mp.INFECTED
