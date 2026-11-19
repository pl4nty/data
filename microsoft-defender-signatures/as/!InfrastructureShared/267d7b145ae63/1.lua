-- Threat: !InfrastructureShared
-- Name: 267d7b145ae63
-- Type: 21
-- Includes: AICopilotHelpers

if not initiating_process_gate() then
  return mp.CLEAN
end
if not current_cmdline_matches_prompt_link_runtime_checks() then
  return mp.CLEAN
end
local l_0_0 = mp.GetScannedPPID()
local l_0_1 = l_0_0 and mp.GetProcessCommandLine(l_0_0) or nil
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
if not string.find(l_0_2, "copilot.microsoft.com", 1, true) then
  return mp.CLEAN
end
local l_0_3 = urldecode(l_0_2) or l_0_2
local l_0_5 = string.find(l_0_3, "repeat each action twice", 1, true) ~= nil or string.find(l_0_3, "do it twice", 1, true) ~= nil or string.find(l_0_3, "repeat twice", 1, true) ~= nil
local l_0_7 = string.find(l_0_3, "$param", 1, true) ~= nil or string.find(l_0_3, "baseurl", 1, true) ~= nil or string.find(l_0_3, "pseudo code", 1, true) ~= nil
if not l_0_5 and not l_0_7 then
  return mp.CLEAN
end
extract_cmdline_payload("")
return mp.INFECTED
