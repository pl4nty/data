-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17ab3964fd60a\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC10: Overwrote pending register: R0 in 'AssignReg'

do
  if this_sigattrlog[1] and (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC34: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not this_sigattrlog[2] or not (this_sigattrlog[2]).matched or this_sigattrlog[3]) and (this_sigattrlog[3]).matched then
      local l_0_1 = this_sigattrlog[2]
    else
    end
    -- DECOMPILER ERROR at PC58: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not this_sigattrlog[4] or not (this_sigattrlog[4]).matched or this_sigattrlog[5]) and (this_sigattrlog[5]).matched then
        local l_0_2 = this_sigattrlog[4]
      else
      end
      -- DECOMPILER ERROR at PC82: Overwrote pending register: R0 in 'AssignReg'

      do
        if (not this_sigattrlog[6] or not (this_sigattrlog[6]).matched or this_sigattrlog[7]) and (this_sigattrlog[7]).matched then
          local l_0_3, l_0_4, l_0_5 = this_sigattrlog[6]
        else
        end
        if this_sigattrlog[8] and (this_sigattrlog[8]).matched then
          do return mp.CLEAN end
          local l_0_6 = this_sigattrlog[8]
          if not l_0_6.matched or not ((bm.get_current_process_startup_info)()).ppid then
            return mp.CLEAN
          end
          if (MpCommon.IsFriendlyProcess)(((bm.get_current_process_startup_info)()).ppid) then
            return mp.CLEAN
          end
          local l_0_7 = nil
          if not l_0_6.utf8p2 then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC130: Confused about usage of register: R2 in 'UnsetPending'

          local l_0_8 = nil
          ;
          (mp.TriggerScanResource)("ems", (string.format)("%s,address:%s,size:0", l_0_7.ppid, l_0_6.utf8p2))
          local l_0_9 = nil
          AppendToRollingQueue((string.format)("susp_regions:%s", l_0_7.ppid), l_0_8)
          ;
          (bm.trigger_sig)("ScanSuspiciousRegions", l_0_9, l_0_7.ppid)
          return mp.INFECTED
        end
      end
    end
  end
end

