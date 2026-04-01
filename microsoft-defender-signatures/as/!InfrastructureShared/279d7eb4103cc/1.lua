-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\279d7eb4103cc\1.luac 

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
  do
    local l_0_3, l_0_4 = , current_parent_info_and_name()
    if l_0_0 == nil then
      return mp.CLEAN
    end
    if l_0_0 == "msedge.exe" or l_0_0 == "chrome.exe" or l_0_0 == "brave.exe" or l_0_0 == "opera.exe" or l_0_0 == "vivaldi.exe" or l_0_0 == "firefox.exe" or l_0_0 == "msedgewebview2.exe" or l_0_0 == "copilot.exe" or l_0_0 == "applicationframehost.exe" or l_0_0 == "runtimebroker.exe" or l_0_0 == "svchost.exe" or l_0_0 == "explorer.exe" or l_0_0 == "searchapp.exe" or l_0_0 == "searchhost.exe" or l_0_0 == "widgets.exe" or l_0_0 == "microsoftedgeupdate.exe" or l_0_0 == "googleupdate.exe" or l_0_0 == "braveupdate.exe" or l_0_0 == "code.exe" then
      return mp.CLEAN
    end
    if l_0_0 == "winword.exe" or l_0_0 == "excel.exe" or l_0_0 == "powerpnt.exe" or l_0_0 == "outlook.exe" or l_0_0 == "olk.exe" or l_0_0 == "onenote.exe" or l_0_0 == "mspub.exe" or l_0_0 == "visio.exe" or l_0_0 == "ms-teams.exe" or l_0_0 == "teams.exe" or l_0_0 == "slack.exe" or l_0_0 == "discord.exe" or l_0_0 == "zoom.exe" or l_0_0 == "thunderbird.exe" or l_0_0 == "acrord32.exe" or l_0_0 == "acrobat.exe" or l_0_0 == "foxitpdfreader.exe" or l_0_0 == "sumatrapdf.exe" then
      return mp.CLEAN
    end
    if l_0_0 == "cmd.exe" or l_0_0 == "powershell.exe" or l_0_0 == "pwsh.exe" or l_0_0 == "python.exe" or l_0_0 == "perl.exe" or l_0_0 == "wscript.exe" or l_0_0 == "cscript.exe" or l_0_0 == "mshta.exe" or l_0_0 == "wmic.exe" then
      return mp.CLEAN
    end
    extract_cmdline_payload(R9_PC234)
    do return mp.INFECTED end
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

