-- Threat: !InfrastructureShared
-- Name: 51416bd36a6f
-- Type: 21

if not nri.IsResponse() then
  return mp.CLEAN
end
local l_0_0 = nri.GetRawResponseBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.match(l_0_0, "^HTTP/%d%.%d[ \t]+%d%d%d[^\r\n]*\r\n") then
  local l_0_1 = string.find(l_0_0, "\r\n\r\n", 1, true)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_0 = string.sub(l_0_0, l_0_1 + 4)
end
local l_0_2 = string.lower(l_0_0)
local l_0_3 = "<h1(?:[ \\t\\r\\n]+[^>]{0,128})?>[ \\t\\r\\n]*php version[ \\t]+" .. "(?!(?:8\\.2\\.(?:3[5-9]|[4-9][0-9]|[1-9][0-9]{2,3})|" .. "8\\.3\\.(?:3[6-9]|[4-9][0-9]|[1-9][0-9]{2,3})|" .. "8\\.4\\.(?:2[7-9]|[3-9][0-9]|[1-9][0-9]{2,3})|" .. "8\\.5\\.(?:1[2-9]|[2-9][0-9]|[1-9][0-9]{2,3})))" .. "(?:5\\.(?:[4-9]|[1-9][0-9]{1,2})|" .. "(?:[6-9]|[1-9][0-9])\\.(?:0|[1-9][0-9]{0,2}))" .. "\\.(?:0|[1-9][0-9]{0,3})(?:[-+][a-z0-9.+~_-]+)?[ \\t\\r\\n]*</h1>"
local l_0_4 = MpCommon.StringRegExpSearch(l_0_3, l_0_2)
if not l_0_4 then
  return mp.CLEAN
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  indicator = "phpinfo_version",
  scope = "provisional_inventory"
})
return mp.INFECTED
