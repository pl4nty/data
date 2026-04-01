-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\279d7d7f23094\1.luac 

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
    if l_0_0 == nil or not l_0_0 == "cmd.exe" or l_0_0 == "powershell.exe" or l_0_0 == "pwsh.exe" or l_0_0 == "python.exe" or l_0_0 == "perl.exe" or l_0_0 == "wscript.exe" or l_0_0 == "cscript.exe" or l_0_0 == "mshta.exe" or l_0_0 == "wmic.exe" then
      return mp.CLEAN
    end
    extract_cmdline_payload(R7_PC143)
    do return mp.INFECTED end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

