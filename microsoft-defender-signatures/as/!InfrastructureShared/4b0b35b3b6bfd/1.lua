-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4b0b35b3b6bfd\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[8]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC22: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[9]).matched or (this_sigattrlog[10]).matched then
      local l_0_1 = this_sigattrlog[9]
    else
    end
    -- DECOMPILER ERROR at PC38: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[11]).matched or (this_sigattrlog[12]).matched then
        local l_0_2 = this_sigattrlog[11]
      else
      end
      -- DECOMPILER ERROR at PC54: Overwrote pending register: R0 in 'AssignReg'

      do
        if not (this_sigattrlog[13]).matched or (this_sigattrlog[14]).matched then
          local l_0_3 = this_sigattrlog[13]
        else
        end
        -- DECOMPILER ERROR at PC70: Overwrote pending register: R0 in 'AssignReg'

        do
          if not (this_sigattrlog[15]).matched or (this_sigattrlog[16]).matched then
            local l_0_4 = this_sigattrlog[15]
          else
          end
          -- DECOMPILER ERROR at PC86: Overwrote pending register: R0 in 'AssignReg'

          do
            if not (this_sigattrlog[17]).matched or (this_sigattrlog[18]).matched then
              local l_0_5, l_0_6, l_0_7 = this_sigattrlog[17]
            end
            -- DECOMPILER ERROR at PC87: Confused about usage of register: R0 in 'UnsetPending'

            -- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

            if not l_0_5 or not l_0_5.utf8p2 then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

            local l_0_8 = nil
            local l_0_9 = (string.lower)(l_0_5.utf8p2)
            if not (bm.get_current_process_startup_info)() then
              return mp.CLEAN
            end
            do
              local l_0_10, l_0_12, l_0_13 = , ((bm.get_current_process_startup_info)()).ppid or "0"
              do
                local l_0_11, l_0_14 = nil
                local l_0_15 = nil
                local l_0_16 = nil
                local l_0_17 = nil
                local l_0_18 = (string.lower)(((bm.get_imagepath)() or ""):match("([^/]+)$") or "")
                local l_0_19 = "NpmCredHarvest_BM"
                local l_0_20 = 600
                local l_0_21 = 1
                local l_0_22 = 100
                if GetRollingQueueKeyValues(l_0_19, tostring(l_0_16) .. "|" .. l_0_18) then
                  for l_0_26,l_0_27 in ipairs(GetRollingQueueKeyValues(l_0_19, tostring(l_0_16) .. "|" .. l_0_18)) do
                    local l_0_23, l_0_24, l_0_25 = nil
                    -- DECOMPILER ERROR at PC147: Confused about usage of register: R17 in 'UnsetPending'

                    if R17_PC147 and R17_PC147.value == l_0_9 then
                      return mp.CLEAN
                    end
                  end
                  -- DECOMPILER ERROR at PC157: Confused about usage of register: R12 in 'UnsetPending'

                  if l_0_21 <= #l_0_25 then
                    local l_0_28 = nil
                    ;
                    (bm.add_related_string)("NpmCredHarvest_BM", safeJsonSerialize({NpmCredHarvestRQName = GetRollingQueueKeys(l_0_19), NpmCredHarvestCount = GetRollingQueueCount(l_0_19)}), bm.RelatedStringBMReport)
                    TrackPidAndTechniqueBM("BM", "T1552.001", "npm_credharvest")
                    add_parents()
                    local l_0_29, l_0_30 = nil
                    -- DECOMPILER ERROR at PC201: Overwrote pending register: R19 in 'AssignReg'

                    if not pcall(reportBmInfo) and reportBmInfo then
                      (bm.add_related_string)("bmInfoFailReason", tostring(R19_PC199), R19_PC199)
                    end
                    return mp.INFECTED
                  end
                end
                do
                  -- DECOMPILER ERROR at PC208: Confused about usage of register: R11 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC212: Overwrote pending register: R19 in 'AssignReg'

                  AppendToRollingQueue(l_0_19, l_0_29, l_0_9, l_0_20, l_0_22, R19_PC199)
                  return mp.CLEAN
                end
              end
            end
          end
        end
      end
    end
  end
end

