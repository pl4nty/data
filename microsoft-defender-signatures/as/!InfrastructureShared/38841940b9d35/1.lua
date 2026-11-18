-- Threat: !InfrastructureShared
-- Name: 38841940b9d35
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = {}
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2 = tonumber(nri.GetHttpResponseHeader("Content-Length"))
if l_0_2 and 15000 < l_0_2 then
  return mp.CLEAN
end
local l_0_3 = nri.GetRawRequestBlob()
if l_0_3 == nil then
  l_0_3 = nri.GetRawResponseBlob()
end
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = {
  "exec",
  "exploit",
  "binary",
  "start",
  "child_process",
  "_chunks",
  "execsync"
}
if contains(l_0_3, l_0_4) then
  local l_0_5 = {
    "wget",
    "curl",
    "powershell",
    "bash",
    "certutil",
    "cmd",
    "mshta",
    "python",
    "bitsadmin",
    "/bin/sh",
    "nc ",
    "touch",
    "/tmp/",
    "/etc/",
    "shell",
    "pwned"
  }
  if contains(l_0_3, l_0_5) then
    local l_0_6 = nri.GetURI()
    if l_0_6 then
      l_0_1.uri = l_0_6
    end
    l_0_1.dest_address = l_0_0
    l_0_1.NRI_RBlob = tohex(l_0_3)
    nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_1)
    reportHeaders({"Host", "User-Agent"})
    return mp.INFECTED
  end
end
return mp.CLEAN
