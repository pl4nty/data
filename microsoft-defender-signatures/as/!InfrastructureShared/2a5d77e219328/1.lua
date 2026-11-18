-- Threat: !InfrastructureShared
-- Name: 2a5d77e219328
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
local l_0_5 = string.find(l_0_3, "search this page", 1, true) ~= nil or string.find(l_0_3, "search the page", 1, true) ~= nil
local l_0_7 = string.find(l_0_3, "use its instructions", 1, true) ~= nil or string.find(l_0_3, "follow its instructions", 1, true) ~= nil
local l_0_9 = string.find(l_0_3, "instructions", 1, true) ~= nil
if not (l_0_5 and l_0_7) or not l_0_9 then
  return mp.CLEAN
end
extract_cmdline_payload("")
return mp.INFECTED
