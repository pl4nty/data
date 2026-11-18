-- Threat: !InfrastructureShared
-- Name: 8741840394ee
-- Type: 21

if not nri.IsResponse() then
  return mp.CLEAN
end
local l_0_0 = "^(?:[ \\t]*|[^\\r\\n]*[ \\t,\\x3b(])php/" .. "(?!(?:8\\.2\\.(?:3[5-9]|[4-9][0-9]|[1-9][0-9]{2,3})|" .. "8\\.3\\.(?:3[6-9]|[4-9][0-9]|[1-9][0-9]{2,3})|" .. "8\\.4\\.(?:2[7-9]|[3-9][0-9]|[1-9][0-9]{2,3})|" .. "8\\.5\\.(?:1[2-9]|[2-9][0-9]|[1-9][0-9]{2,3})))" .. "(?:5\\.(?:[4-9]|[1-9][0-9]{1,2})|" .. "(?:[6-9]|[1-9][0-9])\\.(?:0|[1-9][0-9]{0,2}))" .. "\\.(?:0|[1-9][0-9]{0,3})(?:[-+][a-z0-9.+~_-]+)?(?:[ \\t,\\x3b)]|$)"
local l_0_1
for l_0_2, l_0_3 in ipairs({
  "Server",
  "X-Powered-By"
}) do
  local l_0_4 = nri.GetHttpResponseHeader(l_0_3)
  if l_0_4 ~= nil then
    local l_0_5 = string.lower(l_0_4)
    if MpCommon.StringRegExpSearch(l_0_0, l_0_5) then
      l_0_1 = l_0_3
    end
  end
end
if l_0_1 == nil then
  return mp.CLEAN
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  indicator = "php_version_header",
  scope = "provisional_inventory",
  header = l_0_1
})
return mp.INFECTED
