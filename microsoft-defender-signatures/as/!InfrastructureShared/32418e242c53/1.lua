-- Threat: !InfrastructureShared
-- Name: 32418e242c53
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 ~= nil then
  local l_0_1 = {
    "getParameter",
    "cmd=",
    "InputStream",
    "webapps//ROOT//",
    "class",
    "suffix",
    "tomcatwar",
    "whoami",
    "pwd"
  }
  if not contains(l_0_0, l_0_1) then
    return mp.CLEAN
  end
  local l_0_2 = nri.GetRawRequestBlob()
  if l_0_2 ~= nil and string.len(l_0_2) < 4096 then
    local l_0_3 = {}
    l_0_3.NRI_ResponseBlob = tohex(l_0_2)
    nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_3)
  end
  return mp.INFECTED
end
return mp.CLEAN
