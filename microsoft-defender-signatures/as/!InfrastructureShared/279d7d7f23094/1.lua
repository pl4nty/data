-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\279d7d7f23094\1.luac 

-- params : ...
-- function num : 0
if not current_cmdline_matches_prompt_link_runtime_checks() then
  return mp.CLEAN
end
do
  local l_0_0, l_0_1 = current_parent_info_and_name()
  if l_0_1 == nil or not l_0_1 == "cmd.exe" or l_0_1 == "powershell.exe" or l_0_1 == "pwsh.exe" or l_0_1 == "python.exe" or l_0_1 == "perl.exe" or l_0_1 == "wscript.exe" or l_0_1 == "cscript.exe" or l_0_1 == "mshta.exe" or l_0_1 == "wmic.exe" then
    return mp.CLEAN
  end
  extract_cmdline_payload(l_0_1)
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

