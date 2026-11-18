-- Threat: !InfrastructureShared
-- Name: da419de67e19
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = {}
local l_0_1 = nri.GetRawRequestBlob()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  ".exec",
  "exploit",
  "child_process",
  "_chunks",
  "spawn",
  "eval",
  "whomai",
  "execsync"
}
if contains(l_0_1, l_0_2) then
  l_0_0.NRI_RequestBlob = tohex(l_0_1)
  nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
  reportHeaders({"Host", "User-Agent"})
  return mp.INFECTED
end
return mp.CLEAN
