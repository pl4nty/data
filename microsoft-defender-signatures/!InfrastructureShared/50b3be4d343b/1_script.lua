-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\50b3be4d343b\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0:sub(1, 2) == "\\\\" or l_0_0:sub(1, 3) == "\"\\\\" or l_0_0:sub(1, 3) == "\'\\\\" then
    if l_0_0:find("\\sysvol", 1, true) or l_0_0:find("\\netlogon", 1, true) or l_0_0:find("\\ccm", 1, true) or l_0_0:find("\\sccm", 1, true) then
      return mp.CLEAN
    end
    local l_0_8 = nil
    if (bm.get_current_process_startup_info)() == nil or ((bm.get_current_process_startup_info)()).command_line == nil or ((bm.get_current_process_startup_info)()).image_path == nil then
      return mp.CLEAN
    end
    if IsHostAttackServerCloudChk(l_0_8, "Behavior:Win32/XferFromAttackerServer.B", ((bm.get_current_process_startup_info)()).image_path, ((bm.get_current_process_startup_info)()).command_line, "SMBCopyToShare") then
      bm_AddRelatedFileFromCommandLine((this_sigattrlog[1]).utf8p2, nil, nil, 6)
      TrackPidAndTechniqueBM((this_sigattrlog[1]).ppid, "T1057", "xfer_from_attackerserver_b")
      return mp.INFECTED
    end
  end
  do
    return mp.CLEAN
  end
end

