-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e7d7864fdc2b\1.luac 

-- params : ...
-- function num : 0
if not initiating_process_gate() then
  return mp.CLEAN
end
if not current_cmdline_matches_prompt_link_runtime_checks() then
  return mp.CLEAN
end
local l_0_0 = (mp.GetScannedPPID)()
do
  local l_0_1, l_0_2 = l_0_0 and (mp.GetProcessCommandLine)(l_0_0) or nil
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  if not (string.find)((string.lower)(l_0_1), "copilot.microsoft.com", 1, true) then
    return mp.CLEAN
  end
  extract_cmdline_payload("")
  return mp.INFECTED
end

