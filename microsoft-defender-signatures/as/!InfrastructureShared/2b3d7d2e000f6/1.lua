-- Threat: !InfrastructureShared
-- Name: 2b3d7d2e000f6
-- Type: 21
-- Includes: AICopilotHelpers

if not current_cmdline_matches_prompt_link_runtime_checks() then
  return mp.CLEAN
end
local l_0_0, l_0_1 = current_parent_info_and_name()
local l_0_3 = l_0_1 == "cmd.exe" or l_0_1 == "powershell.exe" or l_0_1 == "pwsh.exe" or l_0_1 == "python.exe" or l_0_1 == "perl.exe" or l_0_1 == "wscript.exe" or l_0_1 == "cscript.exe" or l_0_1 == "mshta.exe" or l_0_1 == "wmic.exe"
if l_0_1 == nil or not l_0_3 then
  return mp.CLEAN
end
extract_cmdline_payload(l_0_1)
return mp.INFECTED
