-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\12fb33b643e09\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC15: Overwrote pending register: R2 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and this_sigattrlog[2] ~= nil and this_sigattrlog[2] ~= "" then
    local l_0_6, l_0_7 = nil, nil
  end
  do
    if (this_sigattrlog[3]).matched and this_sigattrlog[3] ~= nil and this_sigattrlog[3] ~= "" then
      local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4 = (string.lower)((this_sigattrlog[3]).utf8p1), nil
    else
    end
    if (this_sigattrlog[4]).matched and this_sigattrlog[4] ~= nil and this_sigattrlog[4] ~= "" then
      local l_0_5 = nil
      -- DECOMPILER ERROR at PC65: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC67: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

      if l_0_5 == nil or l_0_5 == "" or l_0_2 == nil or l_0_2 == "" or ((string.lower)((this_sigattrlog[4]).utf8p1)):match("[^/]*$") == nil or ((string.lower)((this_sigattrlog[4]).utf8p1)):match("[^/]*$") == "" then
        return mp.CLEAN
      end
      if (string.find)(l_0_5, "/system/library/launch", 1, true) ~= 1 then
        local l_0_8 = nil
        -- DECOMPILER ERROR at PC92: Confused about usage of register: R3 in 'UnsetPending'

        -- DECOMPILER ERROR at PC99: Confused about usage of register: R3 in 'UnsetPending'

        if GetRollingQueueCount("MAC_PERSIST_PROG_PATHS") > 0 and IsKeyInRollingQueue("MAC_PERSIST_PROG_PATHS", l_0_8, true) then
          local l_0_9 = nil
          if GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_8) ~= nil and #GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_8) > 0 then
            for l_0_13,l_0_14 in ipairs(GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_8)) do
              local l_0_10, l_0_11 = nil
              -- DECOMPILER ERROR at PC113: Confused about usage of register: R9 in 'UnsetPending'

              if (string.lower)(R9_PC113) == l_0_9 then
                TrackPidAndTechniqueBM("BM", "T1036.004", "DefenseEvasion_Masquerading_TaskOrService_Mac")
                ;
                (mp.set_mpattribute)("DefenseEvasion_Masquerading_TaskOrService_Mac")
                return mp.INFECTED
              end
            end
          end
        end
      end
      do
        return mp.CLEAN
      end
    end
  end
end

