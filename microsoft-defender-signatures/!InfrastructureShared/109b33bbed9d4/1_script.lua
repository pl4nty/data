-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\109b33bbed9d4\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[10]).matched or (this_sigattrlog[10]).utf8p1 == nil or (this_sigattrlog[11]).matched) and (this_sigattrlog[11]).utf8p1 ~= nil then
      local l_0_1 = (this_sigattrlog[10]).utf8p1
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[12]).matched or (this_sigattrlog[12]).utf8p1 == nil or (this_sigattrlog[13]).matched) and (this_sigattrlog[13]).utf8p1 ~= nil then
        local l_0_2, l_0_3, l_0_4 = (this_sigattrlog[12]).utf8p1
      end
      -- DECOMPILER ERROR at PC69: Confused about usage of register: R0 in 'UnsetPending'

      -- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

      if l_0_2 ~= nil then
        taint(l_0_2, "remote_file_created_taint_inWWWD", 3600)
        local l_0_5 = nil
        if not isnull(((bm.get_current_process_startup_info)()).ppid) then
          local l_0_6, l_0_7 = , (bm.get_process_relationships)(((bm.get_current_process_startup_info)()).ppid)
          AppendToRollingQueue("queue_pid_taintfactory_a", l_0_6.ppid, 1, 600)
          for l_0_11,l_0_12 in ipairs(l_0_7) do
            local l_0_8 = nil
            -- DECOMPILER ERROR at PC100: Confused about usage of register: R8 in 'UnsetPending'

            ;
            (bm.add_related_process)((600).ppid)
            -- DECOMPILER ERROR at PC103: Confused about usage of register: R8 in 'UnsetPending'

            TrackPidAndTechniqueBM((600).ppid, "T1105", "CommandAndControl_IngressToolsTransfer")
          end
        end
        do
          do
            l_0_7 = bm
            l_0_7 = l_0_7.trigger_sig
            l_0_7("RemoteFileCopyInWWD", l_0_5)
            l_0_7 = mp
            l_0_7 = l_0_7.INFECTED
            do return l_0_7 end
            l_0_6 = mp
            l_0_6 = l_0_6.CLEAN
            return l_0_6
          end
        end
      end
    end
  end
end

