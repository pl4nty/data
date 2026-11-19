-- Threat: !InfrastructureShared
-- Name: 5741b4c13d59
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = {
  useragent = nri.GetHttpRequestHeader("User-Agent")
}
local l_0_1 = nri.GetRawRequestBlob()
if l_0_1 ~= nil and string.len(l_0_1) < 1024 then
  l_0_0.NRI_RequestBlob = tohex(l_0_1)
end
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
