-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6eb34b7098c3\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = nil
  end
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (string.lower)((this_sigattrlog[2]).utf8p2)) and (((string.lower)((this_sigattrlog[2]).utf8p2)):sub(1, 2) == "\\\\" or ((string.lower)((this_sigattrlog[2]).utf8p2)):sub(1, 3) == "\"\\\\" or ((string.lower)((this_sigattrlog[2]).utf8p2)):sub(1, 3) == "\'\\\\") then
      local l_0_6 = nil
      if (bm.get_current_process_startup_info)() == nil or ((bm.get_current_process_startup_info)()).command_line == nil or ((bm.get_current_process_startup_info)()).image_path == nil then
        return mp.CLEAN
      end
      if IsHostAttackServerCloudChk(l_0_6, "Behavior:Win32/XferToAttackerServer.A", ((bm.get_current_process_startup_info)()).image_path, ((bm.get_current_process_startup_info)()).command_line, "SMBCopyToShare") then
        TrackPidAndTechniqueBM("BM", "T1057", "xfer_to_attackerserver_a")
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

