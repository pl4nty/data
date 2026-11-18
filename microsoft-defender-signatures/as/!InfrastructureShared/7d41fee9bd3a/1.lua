-- Threat: !InfrastructureShared
-- Name: 7d41fee9bd3a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
  l_0_1 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
  l_0_1 = this_sigattrlog[2].utf8p2
end
if not contains(l_0_1, "/command/base64/") then
  return mp.CLEAN
end
l_0_2 = string.match(l_0_1, "Command%/Base64%/(.*)\"?'?}")
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_3 = MpCommon.Base64Decode(l_0_2)
if l_0_3 ~= nil and (string.find(l_0_3, "curl", 1, true) or string.find(l_0_3, "wget", 1, true) or string.find(l_0_3, "powershell", 1, true) or string.find(l_0_3, "python", 1, true) or string.find(l_0_3, "mshta", 1, true) or string.find(l_0_3, "certutil", 1, true) or string.find(l_0_3, "cmd", 1, true)) then
  local l_0_4 = {
    ["[" .. l_0_0 .. "]"] = "[" .. l_0_1 .. "]"
  }
  nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_4)
  return mp.INFECTED
end
return mp.CLEAN
