-- Threat: !InfrastructureShared
-- Name: e5406b8aca9e
-- Type: 21

if nri.IsResponse() then
  return mp.CLEAN
end
local l_0_0 = string.lower(nri.GetHttpRequestHeader("Host") or "")
if l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("^([^:]+)") or l_0_0
local l_0_2, l_0_3 = l_0_1:match("^([^.]+)%.(.+)$")
if not l_0_2 or not l_0_3 then
  return mp.CLEAN
end
if not l_0_3:match("^[%w%.%-]+%a%a+$") then
  return mp.CLEAN
end
local l_0_4 = false
local l_0_5, l_0_6, l_0_7, l_0_8 = l_0_2:match("^([%l]+)%-([%l]+)%-([%l]+)%-([%l]+)$")
if l_0_5 and 4 <= #l_0_5 and 4 <= #l_0_6 and 4 <= #l_0_7 and 4 <= #l_0_8 then
  l_0_4 = true
end
if not l_0_4 and 32 <= #l_0_2 and l_0_2:match("^[%x]+$") then
  l_0_4 = true
end
if not l_0_4 and 20 <= #l_0_2 and l_0_2:match("^[%l%d]+$") then
  l_0_4 = true
end
if not l_0_4 then
  return mp.CLEAN
end
local l_0_9 = {
  "amazonaws.com",
  "cloudfront.net",
  "snowflakecomputing.com",
  "salesforce.com",
  "googleapis.com",
  "azurewebsites.net",
  "microsoftonline.com",
  "slack.com"
}
for l_0_10, l_0_11 in ipairs(l_0_9) do
  local l_0_12 = "." .. l_0_11
  if l_0_1 == l_0_11 or l_0_1:sub(-#l_0_12) == l_0_12 then
    return mp.CLEAN
  end
end
local l_0_13 = nri.GetHttpRequestHeader("Authorization") or ""
local l_0_14 = nri.GetHttpRequestHeader("X-API-Key") or ""
local l_0_15 = nri.GetHttpRequestHeader("Api-Key") or ""
local l_0_16 = nri.GetHttpRequestHeader("X-Auth-Token") or ""
local l_0_17 = nri.GetHttpRequestHeader("X-NPM-Token") or ""
local l_0_18 = nri.GetHttpRequestHeader("Cookie") or ""
if l_0_13 == "" and l_0_14 == "" and l_0_15 == "" and l_0_16 == "" and l_0_17 == "" and l_0_18 == "" then
  return mp.CLEAN
end
local l_0_19 = string.lower(nri.GetHttpRequestHeader("User-Agent") or "")
local l_0_20 = "implicit-via-nri-firing-model"
if string.find(l_0_19, "axios/", 1, true) then
  l_0_20 = "axios"
elseif string.find(l_0_19, "node-fetch", 1, true) then
  l_0_20 = "node-fetch"
elseif string.find(l_0_19, "undici", 1, true) then
  l_0_20 = "undici"
elseif string.find(l_0_19, "got (", 1, true) or string.find(l_0_19, "got/", 1, true) then
  l_0_20 = "got"
end
local l_0_21 = nri.GetHttpCommand()
local l_0_22 = {
  [nri.HTTP_POST] = "POST",
  [nri.HTTP_GET] = "GET",
  [nri.HTTP_PUT] = "PUT",
  [nri.HTTP_DELETE] = "DELETE"
}
local l_0_23 = l_0_22[l_0_21] or "UNKNOWN"
local l_0_24 = {
  useragent = nri.GetHttpRequestHeader("User-Agent"),
  method = l_0_23,
  lib_fingerprint = l_0_20
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_24)
return mp.INFECTED
