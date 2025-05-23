-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\132b3ecdeb4c0\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16, l_0_17 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil and l_0_0 ~= "" then
    if (not (string.find)(l_0_0, "/home", 1, true) or (not (string.find)(l_0_0, ".local", 1, true) and not (string.find)(l_0_0, ".vscode", 1, true) and not (string.find)(l_0_0, "logstash", 1, true) and not (string.find)(l_0_0, "android-studio", 1, true)) or (not (string.find)(l_0_0, "jbr", 1, true) and not (string.find)(l_0_0, "jdk", 1, true) and not (string.find)(l_0_0, "jre", 1, true)) or (string.find)(l_0_0, "/bin/java", 1, true)) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC103: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC112: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC121: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC130: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC139: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC155: Confused about usage of register: R0 in 'UnsetPending'

    if ((string.find)(l_0_0, "/tmp", 1, true) or (string.find)(l_0_0, "/home", 1, true) or (string.find)(l_0_0, "/dev/shm", 1, true) or (string.find)(l_0_0, "/var/crash", 1, true)) and (string.find)(l_0_0, "java", 1, true) and StringEndsWith(l_0_0, "--version") then
      (bm.trigger_sig)("BMSuspOpenFilesCall.A", l_0_0)
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

