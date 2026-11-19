-- Threat: !InfrastructureShared
-- Name: da41e2d0596b
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
local l_0_3 = string.lower(string.sub(l_0_0, l_0_1))
local l_0_4 = false
local l_0_5 = false
local l_0_6 = false
local l_0_7 = 1
while true do
  local l_0_8 = string.find(l_0_3, "content-disposition:", l_0_7, true)
  if l_0_8 == nil then
    break
  end
  local l_0_9 = string.find(l_0_3, "\r\n", l_0_8, true)
  if l_0_9 == nil then
    break
  end
  local l_0_10 = string.sub(l_0_3, l_0_8, l_0_9 - 1)
  if string.find(l_0_10, "name=\"php_session_upload_progress\"", 1, true) then
    l_0_4 = true
  end
  if string.find(l_0_10, "name=\"phpsessid\"", 1, true) then
    l_0_5 = true
  end
  if string.find(l_0_10, "filename=", 1, true) then
    local l_0_12 = string.find(l_0_10, "<?php", 1, true) ~= nil or string.find(l_0_10, "<?=", 1, true) ~= nil
    local l_0_14 = string.find(l_0_10, "|o:%d+:", 1) ~= nil or string.find(l_0_10, "o:%d+:", 1) ~= nil or string.find(l_0_10, "a:%d+:{", 1) ~= nil or string.find(l_0_10, "s:%d+:", 1) ~= nil or string.find(l_0_10, "r:%d+;", 1) ~= nil
    if l_0_12 and l_0_14 then
      l_0_6 = true
    end
  end
  l_0_7 = l_0_9 + 2
end
if not l_0_4 then
  return mp.CLEAN
end
if not l_0_5 and not l_0_6 then
  return mp.CLEAN
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  indicator = "php_session_upload_progress_request",
  scope = "request_context",
  has_form_session_id = l_0_5 and "true" or "false",
  has_suspicious_filename = l_0_6 and "true" or "false"
})
return mp.INFECTED
