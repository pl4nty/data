-- Threat: !InfrastructureShared
-- Name: 8341650fa419
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = {}
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2 = nri.GetRawRequestBlob()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  "deserialization",
  "system.runtime.serialization",
  "invalid viewstate",
  "base64",
  "payload",
  "javaScriptserializer"
}
if contains(l_0_2, l_0_3) then
  local l_0_4 = nri.GetURI()
  if l_0_4 then
    l_0_1.uri = l_0_4
  end
  l_0_1.dest_address = l_0_0
  l_0_1.NRI_RBlob = tohex(l_0_2)
  nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_1)
  reportHeaders({"Host", "User-Agent"})
  return mp.INFECTED
end
return mp.CLEAN
