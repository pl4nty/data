-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2b3d7ee5333ae\1.luac 

-- params : ...
-- function num : 0
if not current_cmdline_matches_prompt_link_runtime_checks() then
  return mp.CLEAN
end
do
  local l_0_0, l_0_1 = current_parent_info_and_name()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if l_0_1 == "msedge.exe" or l_0_1 == "chrome.exe" or l_0_1 == "brave.exe" or l_0_1 == "opera.exe" or l_0_1 == "vivaldi.exe" or l_0_1 == "firefox.exe" or l_0_1 == "msedgewebview2.exe" or l_0_1 == "copilot.exe" or l_0_1 == "applicationframehost.exe" or l_0_1 == "runtimebroker.exe" or l_0_1 == "svchost.exe" or l_0_1 == "explorer.exe" or l_0_1 == "searchapp.exe" or l_0_1 == "searchhost.exe" or l_0_1 == "widgets.exe" or l_0_1 == "microsoftedgeupdate.exe" or l_0_1 == "googleupdate.exe" or l_0_1 == "braveupdate.exe" or l_0_1 == "code.exe" then
    return mp.CLEAN
  end
  if l_0_1 == "winword.exe" or l_0_1 == "excel.exe" or l_0_1 == "powerpnt.exe" or l_0_1 == "outlook.exe" or l_0_1 == "olk.exe" or l_0_1 == "onenote.exe" or l_0_1 == "mspub.exe" or l_0_1 == "visio.exe" or l_0_1 == "ms-teams.exe" or l_0_1 == "teams.exe" or l_0_1 == "slack.exe" or l_0_1 == "discord.exe" or l_0_1 == "zoom.exe" or l_0_1 == "thunderbird.exe" or l_0_1 == "acrord32.exe" or l_0_1 == "acrobat.exe" or l_0_1 == "foxitpdfreader.exe" or l_0_1 == "sumatrapdf.exe" then
    return mp.CLEAN
  end
  if l_0_1 == "cmd.exe" or l_0_1 == "powershell.exe" or l_0_1 == "pwsh.exe" or l_0_1 == "python.exe" or l_0_1 == "perl.exe" or l_0_1 == "wscript.exe" or l_0_1 == "cscript.exe" or l_0_1 == "mshta.exe" or l_0_1 == "wmic.exe" then
    return mp.CLEAN
  end
  extract_cmdline_payload(l_0_1)
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 6 unprocessed JMP targets
end

