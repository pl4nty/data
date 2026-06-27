-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2a5d77e219328\1.luac 

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
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_3 = nil
  if not (string.find)((string.lower)(l_0_1), "copilot.microsoft.com", 1, true) then
    return mp.CLEAN
  end
  do
    do
      local l_0_4, l_0_5, l_0_6, l_0_8, l_0_9, l_0_10, l_0_13, l_0_14, l_0_18, l_0_20, l_0_23, l_0_27 = , urldecode((string.lower)(l_0_1)) or (string.lower)(l_0_1)
      -- DECOMPILER ERROR at PC55: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC64: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC75: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC84: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC95: Confused about usage of register: R3 in 'UnsetPending'

      if not (string.find)(l_0_5, "search this page", 1, true) ~= nil or (string.find)(l_0_5, "search the page", 1, true) ~= nil or not (string.find)(l_0_5, "use its instructions", 1, true) ~= nil or (string.find)(l_0_5, "follow its instructions", 1, true) ~= nil or not (string.find)(l_0_5, "instructions", 1, true) ~= nil then
        return mp.CLEAN
      end
      extract_cmdline_payload("")
      do return mp.INFECTED end
      -- DECOMPILER ERROR: 5 unprocessed JMP targets
    end
  end
end

