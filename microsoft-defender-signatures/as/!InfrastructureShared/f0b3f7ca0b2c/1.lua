-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f0b3f7ca0b2c\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC81: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC108: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC115: Confused about usage of register: R0 in 'UnsetPending'

  if (not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" or (this_sigattrlog[3]).utf8p2 ~= nil) and is_valid_ip((this_sigattrlog[3]).utf8p2) and ((string.find)((this_sigattrlog[3]).utf8p2, "/bin/bash", 1, true) or (string.find)((this_sigattrlog[3]).utf8p2, "/bin/zsh", 1, true) or (string.find)((this_sigattrlog[3]).utf8p2, "/bin/sh", 1, true) or ((this_sigattrlog[3]).utf8p2):match("\'(bash)\'") or ((this_sigattrlog[3]).utf8p2):match("\"(bash)\"") or ((this_sigattrlog[3]).utf8p2):match("\'(sh)\'") or ((this_sigattrlog[3]).utf8p2):match("\"(sh)\"") or ((this_sigattrlog[3]).utf8p2):match("\'(zsh)\'") or ((this_sigattrlog[3]).utf8p2):match("\"(zsh)\"") or ((this_sigattrlog[3]).utf8p2):find("zsh -i", 1, true) or ((this_sigattrlog[3]).utf8p2):find("bash -i", 1, true) or ((this_sigattrlog[3]).utf8p2):find("sh -i", 1, true)) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

