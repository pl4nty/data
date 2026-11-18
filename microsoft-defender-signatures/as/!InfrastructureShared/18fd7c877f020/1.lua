-- Threat: !InfrastructureShared
-- Name: 18fd7c877f020
-- Type: 21
-- Includes: AICopilotHelpers

if not current_cmdline_matches_prompt_link_runtime_checks() then
  return mp.CLEAN
end
local l_0_0 = mp.GetScannedPPID()
local l_0_1 = l_0_0 and mp.GetProcessCommandLine(l_0_0) or nil
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3
for l_0_4 in l_0_2:gmatch("https?://[^%s\"']+") do
  local l_0_5, l_0_6 = l_0_4:match("^https?://([^/%?\"']+)([^?\"']*)")
  if l_0_5 and l_0_6 and l_0_5:match("^([^:]+)") == "m365.cloud.microsoft" and (l_0_6 == "/search" or l_0_6 == "/search/") then
    l_0_3 = l_0_4
    break
  end
end
if l_0_3 == nil then
  return mp.CLEAN
end
if string.find(l_0_3, "?q=", 1, true) == nil and string.find(l_0_3, "&q=", 1, true) == nil and string.find(l_0_3, "%3fq%3d", 1, true) == nil and string.find(l_0_3, "%26q%3d", 1, true) == nil then
  return mp.CLEAN
end
local l_0_7 = urldecode(l_0_3) or l_0_3
local l_0_8 = l_0_7:match("[?&]q=([^&]+)") or ""
l_0_8 = l_0_8:gsub("+", " ")
local l_0_9 = urldecode(l_0_8) or l_0_8
l_0_9 = urldecode(l_0_9) or l_0_9
local l_0_11 = string.find(l_0_9, "<img", 1, true) ~= nil or string.find(l_0_9, "src=", 1, true) ~= nil or string.find(l_0_9, "searchbyimage", 1, true) ~= nil or string.find(l_0_9, "cbir=sbi", 1, true) ~= nil or string.find(l_0_9, "imgurl=", 1, true) ~= nil or string.find(l_0_9, "search for email", 1, true) ~= nil or string.find(l_0_9, "take its title", 1, true) ~= nil or string.find(l_0_9, "embed it in an image url", 1, true) ~= nil or string.find(l_0_9, "put inside", 1, true) ~= nil
if not l_0_11 then
  return mp.CLEAN
end
extract_cmdline_payload("")
return mp.INFECTED
