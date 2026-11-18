-- Threat: !InfrastructureShared
-- Name: 89413f34e44b
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
local l_0_1 = 1
if string.match(l_0_0, "^POST[ \t]+[^\r\n]+[ \t]+HTTP/%d%.%d\r\n") then
  local l_0_2 = string.find(l_0_0, "\r\n\r\n", 1, true)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  l_0_1 = l_0_2 + 4
end
if not string.find(l_0_0, "PHP_SESSION_UPLOAD_PROGRESS", l_0_1, true) then
  return mp.CLEAN
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  indicator = "php_session_upload_progress",
  scope = "request_context"
})
return mp.INFECTED
