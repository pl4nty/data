-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\22dd72941c6fe\1.luac 

-- params : ...
-- function num : 0
if not current_cmdline_matches_prompt_link_runtime_checks() then
  return mp.CLEAN
end
local l_0_0, l_0_1 = current_parent_info_and_name()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1
-- DECOMPILER ERROR at PC80: Unhandled construct in 'MakeBoolean' P3

if (l_0_1 ~= "msedge.exe" and l_0_1 ~= "chrome.exe" and l_0_1 ~= "brave.exe" and l_0_1 ~= "opera.exe" and l_0_1 ~= "vivaldi.exe" and l_0_1 ~= "firefox.exe" and l_0_1 ~= "msedgewebview2.exe" and l_0_0 == nil) or not l_0_1 == "winword.exe" or l_0_1 == "excel.exe" or l_0_1 == "powerpnt.exe" or l_0_1 == "outlook.exe" or l_0_1 == "olk.exe" or l_0_1 == "onenote.exe" or l_0_1 == "mspub.exe" or l_0_1 == "visio.exe" or l_0_1 == "ms-teams.exe" or l_0_1 == "teams.exe" or l_0_1 == "slack.exe" or l_0_1 == "discord.exe" or l_0_1 == "zoom.exe" or l_0_1 == "thunderbird.exe" or l_0_1 == "acrord32.exe" or l_0_1 == "acrobat.exe" or l_0_1 == "foxitpdfreader.exe" or l_0_1 == "sumatrapdf.exe" then
  return mp.CLEAN
end
local l_0_11 = nil
do
  do
    local l_0_12 = nil
    if normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == nil or not normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "winword.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "excel.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "powerpnt.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "outlook.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "olk.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "onenote.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "mspub.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "visio.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "ms-teams.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "teams.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "slack.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "discord.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "zoom.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "thunderbird.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "acrord32.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "acrobat.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "foxitpdfreader.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid)) == "sumatrapdf.exe" then
      return mp.CLEAN
    end
    l_0_2 = normalize_parent_process_name((mp.GetParentProcInfo)(l_0_0.ppid))
    extract_cmdline_payload(l_0_2)
    do return mp.INFECTED end
    -- DECOMPILER ERROR: 8 unprocessed JMP targets
  end
end

