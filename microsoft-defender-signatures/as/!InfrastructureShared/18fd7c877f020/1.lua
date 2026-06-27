-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\18fd7c877f020\1.luac 

-- params : ...
-- function num : 0
if not current_cmdline_matches_prompt_link_runtime_checks() then
  return mp.CLEAN
end
local l_0_0 = (mp.GetScannedPPID)()
do
  local l_0_1, l_0_2 = l_0_0 and (mp.GetProcessCommandLine)(l_0_0) or nil
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_3 = nil
  local l_0_4 = ((string.lower)(l_0_1))
  for l_0_8 in l_0_4:gmatch("https?://[^%s\"\']+") do
    local l_0_5 = nil
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R7 in 'UnsetPending'

    local l_0_10 = R7_PC33:match("^https?://([^/%?\"\']+)([^?\"\']*)")
    if l_0_10 and R7_PC33 and l_0_10:match("^([^:]+)") == "m365.cloud.microsoft" and (R7_PC33 == "/search" or R7_PC33 == "/search/") then
      do
        do
          l_0_5 = l_0_9
          do break end
          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R3 in 'UnsetPending'

  if l_0_5 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC69: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC78: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC87: Confused about usage of register: R3 in 'UnsetPending'

  if (string.find)(l_0_5, "?q=", 1, true) == nil and (string.find)(l_0_5, "&q=", 1, true) == nil and (string.find)(l_0_5, "%3fq%3d", 1, true) == nil and (string.find)(l_0_5, "%26q%3d", 1, true) == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC98: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC102: Confused about usage of register: R3 in 'UnsetPending'

  do
    local l_0_11, l_0_12, l_0_14 = , urldecode(l_0_5) or l_0_5
    -- DECOMPILER ERROR at PC103: Confused about usage of register: R4 in 'UnsetPending'

    do
      local l_0_13 = nil
      local l_0_15 = nil
      -- DECOMPILER ERROR at PC119: Confused about usage of register: R5 in 'UnsetPending'

      do
        local l_0_16 = nil
        do
          -- DECOMPILER ERROR at PC127: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC136: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC145: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC154: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC163: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC172: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC181: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC190: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC199: Confused about usage of register: R6 in 'UnsetPending'

          if not not urldecode(urldecode((l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) or (l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) and (string.find)(urldecode((l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) or (l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " "), "<img", 1, true) ~= nil or (string.find)(urldecode((l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) or (l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " "), "src=", 1, true) ~= nil or (string.find)(urldecode((l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) or (l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " "), "searchbyimage", 1, true) ~= nil or (string.find)(urldecode((l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) or (l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " "), "cbir=sbi", 1, true) ~= nil or (string.find)(urldecode((l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) or (l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " "), "imgurl=", 1, true) ~= nil or (string.find)(urldecode((l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) or (l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " "), "search for email", 1, true) ~= nil or (string.find)(urldecode((l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) or (l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " "), "take its title", 1, true) ~= nil or (string.find)(urldecode((l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) or (l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " "), "embed it in an image url", 1, true) ~= nil or (string.find)(urldecode((l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " ")) or (l_0_12:match("[?&]q=([^&]+)") or ""):gsub("+", " "), "put inside", 1, true) ~= nil then
            return mp.CLEAN
          end
          extract_cmdline_payload("")
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC219: freeLocal<0 in 'ReleaseLocals'

          -- DECOMPILER ERROR: 2 unprocessed JMP targets
        end
      end
    end
  end
end

