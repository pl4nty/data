-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\132b3ecdeb4c0\0x00001da4_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil and l_0_0 ~= "" and ((string.find)(l_0_0, "/tmp", 1, true) or (string.find)(l_0_0, "/home", 1, true) or (string.find)(l_0_0, "/dev/shm", 1, true) or (string.find)(l_0_0, "/var/crash", 1, true)) and (string.find)(l_0_0, "java", 1, true) and StringEndsWith(l_0_0, "--version") then
    (bm.trigger_sig)("BMSuspOpenFilesCall.A", l_0_0)
    return mp.INFECTED
  end
  return mp.CLEAN
end

