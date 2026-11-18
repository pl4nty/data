-- Threat: !InfrastructureShared
-- Name: 267d71b047eb3
-- Type: 21
-- Includes: AICopilotHelpers

if not current_cmdline_matches_prompt_link_runtime_checks() then
  return mp.CLEAN
end
local l_0_0, l_0_1 = current_parent_info_and_name()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1
local l_0_4 = l_0_1 == "winword.exe" or l_0_1 == "excel.exe" or l_0_1 == "powerpnt.exe" or l_0_1 == "outlook.exe" or l_0_1 == "olk.exe" or l_0_1 == "onenote.exe" or l_0_1 == "mspub.exe" or l_0_1 == "visio.exe" or l_0_1 == "ms-teams.exe" or l_0_1 == "teams.exe" or l_0_1 == "slack.exe" or l_0_1 == "discord.exe" or l_0_1 == "zoom.exe" or l_0_1 == "thunderbird.exe" or l_0_1 == "acrord32.exe" or l_0_1 == "acrobat.exe" or l_0_1 == "foxitpdfreader.exe" or l_0_1 == "sumatrapdf.exe"
if not l_0_4 then
  local l_0_6 = l_0_1 == "msedge.exe" or l_0_1 == "chrome.exe" or l_0_1 == "brave.exe" or l_0_1 == "opera.exe" or l_0_1 == "vivaldi.exe" or l_0_1 == "firefox.exe" or l_0_1 == "msedgewebview2.exe"
  if l_0_0 == nil or l_0_0.ppid == nil or not l_0_6 then
    return mp.CLEAN
  end
  local l_0_7 = mp.GetParentProcInfo(l_0_0.ppid)
  local l_0_8 = normalize_parent_process_name(l_0_7)
  local l_0_10 = l_0_8 == "winword.exe" or l_0_8 == "excel.exe" or l_0_8 == "powerpnt.exe" or l_0_8 == "outlook.exe" or l_0_8 == "olk.exe" or l_0_8 == "onenote.exe" or l_0_8 == "mspub.exe" or l_0_8 == "visio.exe" or l_0_8 == "ms-teams.exe" or l_0_8 == "teams.exe" or l_0_8 == "slack.exe" or l_0_8 == "discord.exe" or l_0_8 == "zoom.exe" or l_0_8 == "thunderbird.exe" or l_0_8 == "acrord32.exe" or l_0_8 == "acrobat.exe" or l_0_8 == "foxitpdfreader.exe" or l_0_8 == "sumatrapdf.exe"
  if l_0_8 == nil or not l_0_10 then
    return mp.CLEAN
  end
  l_0_2 = l_0_8
end
extract_cmdline_payload(l_0_2)
return mp.INFECTED
