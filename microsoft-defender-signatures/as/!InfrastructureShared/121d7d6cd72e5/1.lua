-- Threat: !InfrastructureShared
-- Name: 121d7d6cd72e5
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
if not string.find(string.lower(l_0_1), "copilot.microsoft.com", 1, true) then
  return mp.CLEAN
end
extract_cmdline_payload("")
return mp.INFECTED
