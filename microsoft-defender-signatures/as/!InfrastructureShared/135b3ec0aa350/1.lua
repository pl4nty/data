-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\135b3ec0aa350\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC55: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" or (this_sigattrlog[4]).matched) and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 ~= "" then
      local l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13 = (this_sigattrlog[3]).utf8p2
    end
    -- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC95: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC105: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC115: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC120: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC127: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC134: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 ~= nil and is_valid_ip(l_0_1) and ((string.find)(l_0_1, "/bin/bash", 1, true) or (string.find)(l_0_1, "/bin/zsh", 1, true) or (string.find)(l_0_1, "/bin/sh", 1, true) or l_0_1:match("\'(bash)\'") or l_0_1:match("\"(bash)\"") or l_0_1:match("\'(sh)\'") or l_0_1:match("\"(sh)\"") or l_0_1:match("\'(zsh)\'") or l_0_1:match("\"(zsh)\"") or l_0_1:find("zsh -i", 1, true) or l_0_1:find("bash -i", 1, true) or l_0_1:find("sh -i", 1, true)) then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

