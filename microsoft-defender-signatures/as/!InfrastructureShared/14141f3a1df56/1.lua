-- Threat: !InfrastructureShared
-- Name: 14141f3a1df56
-- Type: 21

local l_0_0 = nri.GetURI()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0):gsub("^%a[%w+%.%-]*://[^/?#]*", "")
l_0_1 = string.match(l_0_1, "^[^?#]*")
local l_0_3 = string.find(l_0_1, "/zz-notexist-", 1, true) ~= nil or string.find(l_0_1, "/zznotexist-", 1, true) ~= nil or string.find(l_0_1, "/artx-nonexistent", 1, true) ~= nil or string.find(l_0_1, "/zzz-nonexistent-xyz123", 1, true) ~= nil or string.find(l_0_1, "/artx2909-zzq7", 1, true) ~= nil
if not l_0_3 then
  return mp.CLEAN
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  stage = "control-probe"
})
return mp.INFECTED
