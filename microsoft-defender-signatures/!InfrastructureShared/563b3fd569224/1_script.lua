-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\563b3fd569224\1_luac 

-- params : ...
-- function num : 0
local l_0_3 = nil
do
  if (this_sigattrlog[12]).matched then
    local l_0_0 = false
  end
  -- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[13]).matched or (this_sigattrlog[14]).matched then
      local l_0_1 = nil
    end
    -- DECOMPILER ERROR at PC32: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[15]).matched or (this_sigattrlog[16]).matched then
        local l_0_2 = nil
        l_0_2 = true
      end
      -- DECOMPILER ERROR at PC49: Overwrote pending register: R0 in 'AssignReg'

      -- DECOMPILER ERROR at PC58: Overwrote pending register: R0 in 'AssignReg'

      -- DECOMPILER ERROR at PC67: Overwrote pending register: R0 in 'AssignReg'

      if ((not (this_sigattrlog[17]).matched or (this_sigattrlog[18]).matched) and not (this_sigattrlog[19]).matched) or IsSenseRelatedProc() == true then
        return mp.CLEAN
      end
      local l_0_4 = true
      if not (bm.get_current_process_startup_info)() or not ((bm.get_current_process_startup_info)()).ppid then
        return mp.CLEAN
      end
      local l_0_5 = nil
      local l_0_6 = nil
      local l_0_7, l_0_8 = , hasSeenBefore(((bm.get_imagepath)()):match("([^\\]+)$"), l_0_3, 7, "TamperingAttemptInMachine")
      if l_0_8 and ((bm.get_imagepath)()):match("([^\\]+)$") >= 3 then
        return mp.CLEAN
      end
      local l_0_9 = nil
      local l_0_10 = 7200
      if l_0_4 == true then
        AppendToRollingQueue("TamperingAlerts_LimitedSet_A", l_0_7 .. "_" .. l_0_3, l_0_5.ppid, l_0_10, 500)
      else
        -- DECOMPILER ERROR at PC129: Confused about usage of register: R8 in 'UnsetPending'

        AppendToRollingQueue("RemotDropped_Malware", l_0_7 .. "_" .. l_0_3, l_0_5.ppid, l_0_10, 500)
      end
      local l_0_11 = nil
      local l_0_12 = GetRollingQueueCount("TamperingAlerts_LimitedSet_A")
      if l_0_12 + GetRollingQueueCount("RemotDropped_Malware") < 2 then
        return mp.CLEAN
      end
      local l_0_13 = nil
      local l_0_14 = false
      local l_0_15 = GetRollingQueue("TamperingAlerts_LimitedSet_A")
      if (l_0_13 <= 1 and l_0_12 <= 1) or l_0_13 == 1 then
        local l_0_16, l_0_17 = , next(GetRollingQueue("RemotDropped_Malware"))
        for l_0_21,l_0_22 in pairs(l_0_15) do
          local l_0_18 = nil
          -- DECOMPILER ERROR at PC166: Confused about usage of register: R20 in 'UnsetPending'

          -- DECOMPILER ERROR at PC169: Overwrote pending register: R11 in 'AssignReg'

          if l_0_18.value == R20_PC166.value then
            break
          end
        end
      else
        do
          local l_0_23, l_0_24 = , next(l_0_15)
          for l_0_28,l_0_29 in pairs(l_0_23) do
            local l_0_25 = nil
            -- DECOMPILER ERROR at PC182: Confused about usage of register: R20 in 'UnsetPending'

            -- DECOMPILER ERROR at PC185: Overwrote pending register: R11 in 'AssignReg'

            if l_0_25.value == R20_PC166.value then
              break
            end
          end
          do
            if l_0_14 then
              l_0_24 = bm
              l_0_24 = l_0_24.add_related_string
              l_0_24("TamperingAlertsOnMachine", safeJsonSerialize(l_0_15), bm.RelatedStringBMReport)
              l_0_24 = bm
              l_0_24 = l_0_24.add_related_string
              l_0_24("NonTamperingAlertsOnMachine", safeJsonSerialize(l_0_23), bm.RelatedStringBMReport)
              l_0_24 = add_parents
              l_0_24()
              l_0_24 = reportRelevantUntrustedEntitiesForPid
              l_0_24 = l_0_24(l_0_5.ppid)
              local l_0_30 = nil
              l_0_30 = bm
              l_0_30 = l_0_30.add_related_string
              l_0_30("UntrustedEntities", safeJsonSerialize(l_0_24), bm.RelatedStringBMReport)
              l_0_30 = mp
              l_0_30 = l_0_30.INFECTED
              return l_0_30
            end
            do
              l_0_24 = mp
              l_0_24 = l_0_24.CLEAN
              return l_0_24
            end
          end
        end
      end
    end
  end
end

