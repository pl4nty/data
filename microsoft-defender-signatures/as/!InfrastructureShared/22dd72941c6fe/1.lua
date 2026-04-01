-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\22dd72941c6fe\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.hstr_full_log)()
do
  if not (l_0_0.br_msedge).matched and not (l_0_0.br_chrome).matched and not (l_0_0.br_brave).matched and not (l_0_0.br_opera).matched then
    local l_0_1 = (l_0_0.br_vivaldi).matched
  end
  local l_0_2 = nil
  if (not l_0_2 or not (l_0_0.flag_single).matched) and (not (l_0_0.br_firefox).matched or not (l_0_0.flag_osint).matched) then
    return mp.CLEAN
  end
  if not (l_0_0.dom_perplexity).matched and not (l_0_0.dom_chatgpt).matched and not (l_0_0.dom_openai).matched and not (l_0_0.dom_copilot).matched and not (l_0_0.dom_claude).matched and not (l_0_0.dom_grok).matched and not (l_0_0.dom_deepseek).matched then
    return mp.CLEAN
  end
  if not (l_0_0.qmark_plain).matched and not (l_0_0.amp_plain).matched and not (l_0_0.qmark_eqenc).matched and not (l_0_0.amp_eqenc).matched and not (l_0_0.qmark_fullenc).matched and not (l_0_0.amp_fullenc).matched and not (l_0_0.htmlamp_plain).matched and not (l_0_0.htmlamp_eqenc).matched then
    return mp.CLEAN
  end
  if not current_cmdline_matches_prompt_link_runtime_checks(l_0_0) then
    return mp.CLEAN
  end
  local l_0_3, l_0_4 = , current_parent_info_and_name()
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_5 = nil
  -- DECOMPILER ERROR at PC185: Unhandled construct in 'MakeBoolean' P3

  if (l_0_5 ~= "msedge.exe" and l_0_5 ~= "chrome.exe" and l_0_5 ~= "brave.exe" and l_0_5 ~= "opera.exe" and l_0_5 ~= "vivaldi.exe" and l_0_5 ~= "firefox.exe" and l_0_5 ~= "msedgewebview2.exe" and l_0_4 == nil) or not l_0_5 == "winword.exe" or l_0_5 == "excel.exe" or l_0_5 == "powerpnt.exe" or l_0_5 == "outlook.exe" or l_0_5 == "olk.exe" or l_0_5 == "onenote.exe" or l_0_5 == "mspub.exe" or l_0_5 == "visio.exe" or l_0_5 == "ms-teams.exe" or l_0_5 == "teams.exe" or l_0_5 == "slack.exe" or l_0_5 == "discord.exe" or l_0_5 == "zoom.exe" or l_0_5 == "thunderbird.exe" or l_0_5 == "acrord32.exe" or l_0_5 == "acrobat.exe" or l_0_5 == "foxitpdfreader.exe" or l_0_5 == "sumatrapdf.exe" then
    return mp.CLEAN
  end
  local l_0_14 = R5_PC190
  do
    do
      local l_0_15 = nil
      if normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == nil or not normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "winword.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "excel.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "powerpnt.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "outlook.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "olk.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "onenote.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "mspub.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "visio.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "ms-teams.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "teams.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "slack.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "discord.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "zoom.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "thunderbird.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "acrord32.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "acrobat.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "foxitpdfreader.exe" or normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid)) == "sumatrapdf.exe" then
        return mp.CLEAN
      end
      l_0_14 = normalize_parent_process_name((mp.GetParentProcInfo)(l_0_4.ppid))
      -- DECOMPILER ERROR at PC240: Confused about usage of register: R5 in 'UnsetPending'

      extract_cmdline_payload(l_0_14)
      do return mp.INFECTED end
      -- DECOMPILER ERROR: 8 unprocessed JMP targets
    end
  end
end

