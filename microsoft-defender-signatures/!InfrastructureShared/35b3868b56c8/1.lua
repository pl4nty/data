-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35b3868b56c8\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil then
    local l_0_1 = nil
    if not isnull(((bm.get_current_process_startup_info)()).command_line) then
      local l_0_2 = nil
      if (string.find)(((bm.get_current_process_startup_info)()).command_line, "-k localService -p -s RemoteRegistry", -36, true) and GetRollingQueue("SuspADSyncAccessByPid4") ~= nil then
        (bm.add_threat_file)(l_0_1)
        return mp.INFECTED
      end
    end
  end
  do
    return mp.CLEAN
  end
end

