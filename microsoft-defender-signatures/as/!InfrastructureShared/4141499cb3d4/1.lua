-- Threat: !InfrastructureShared
-- Name: 4141499cb3d4
-- Type: 21

if nri.IsResponse and nri.IsResponse() then
  return mp.CLEAN
end
local l_0_0 = string.lower(nri.GetURI() or "")
if l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1, l_0_2 = l_0_0:match("^([^?]*)%?(.*)$")
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "/images/searchbyimage", 1, true) == nil then
  return mp.CLEAN
end

local function l_0_3(l_1_0)
  return (l_1_0:gsub("%%(%x%x)", function(l_2_0)
    local l_2_1 = tonumber(l_2_0, 16)
    if l_2_1 == nil then
      return "%" .. l_2_0
    end
    return string.char(l_2_1)
  end))
end

local l_0_4 = l_0_2:match("^cbir=([^&]+)") or l_0_2:match("&cbir=([^&]+)") or ""
if l_0_4 ~= "sbi" then
  return mp.CLEAN
end
local l_0_5 = l_0_2:match("^imgurl=([^&]+)") or l_0_2:match("&imgurl=([^&]+)") or ""
if string.find(l_0_5, "http", 1, true) ~= 1 then
  return mp.CLEAN
end
l_0_5 = l_0_3(l_0_5) or l_0_5
local l_0_7 = string.find(l_0_5, "bing.com", 1, true) ~= nil or string.find(l_0_5, "microsoft.com", 1, true) ~= nil or string.find(l_0_5, "office.com", 1, true) ~= nil or string.find(l_0_5, "sharepoint.com", 1, true) ~= nil or string.find(l_0_5, "onedrive.com", 1, true) ~= nil or string.find(l_0_5, "m365.cloud.microsoft", 1, true) ~= nil
local l_0_9 = string.find(l_0_5, "security_code", 1, true) ~= nil or string.find(l_0_5, "mfa", 1, true) ~= nil or string.find(l_0_5, "otp", 1, true) ~= nil or string.find(l_0_5, "password", 1, true) ~= nil or string.find(l_0_5, "reset", 1, true) ~= nil or string.find(l_0_5, "code_", 1, true) ~= nil
if l_0_7 and not l_0_9 then
  return mp.CLEAN
end
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), {imgurl = l_0_5})
return mp.INFECTED
