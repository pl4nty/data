-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\520b314039eea\0x00000b36_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[20]).matched and (this_sigattrlog[20]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[21]).matched or (this_sigattrlog[21]).utf8p1 == nil or (this_sigattrlog[22]).matched) and (this_sigattrlog[22]).utf8p1 ~= nil then
      local l_0_1, l_0_2, l_0_3 = (this_sigattrlog[21]).utf8p2
    end
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 == nil or l_0_1 == "" then
      return mp.CLEAN
    end
    local l_0_4 = nil
    if IsKeyInRollingQueue("enum_script_attributes", l_0_4, true) then
      local l_0_5 = false
      if GetRollingQueueAsHashTable("enum_script_attributes") == nil then
        return mp.CLEAN
      end
      local l_0_6 = nil
      if StringSplit((GetRollingQueueAsHashTable("enum_script_attributes"))[l_0_4], "|") ~= nil or #StringSplit((GetRollingQueueAsHashTable("enum_script_attributes"))[l_0_4], "|") > 0 then
        for l_0_10 = 1, #StringSplit((GetRollingQueueAsHashTable("enum_script_attributes"))[l_0_4], "|") do
          local l_0_7 = nil
          -- DECOMPILER ERROR at PC78: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (bm.trigger_sig)("BM_ContentAttribs:" .. l_0_7[R7_PC78], l_0_4)
        end
        l_0_5 = true
      end
    end
    do
      if IsKeyInRollingQueue("enum_bm_attributes", l_0_4, true) then
        local l_0_12 = nil
        if GetRollingQueueAsHashTable("enum_bm_attributes") == nil then
          return mp.CLEAN
        end
        local l_0_13 = nil
        if StringSplit((GetRollingQueueAsHashTable("enum_bm_attributes"))[l_0_4], "|") ~= nil or #StringSplit((GetRollingQueueAsHashTable("enum_bm_attributes"))[l_0_4], "|") > 0 then
          for l_0_17 = 1, #StringSplit((GetRollingQueueAsHashTable("enum_bm_attributes"))[l_0_4], "|") do
            local l_0_14 = nil
            -- DECOMPILER ERROR at PC116: Confused about usage of register: R7 in 'UnsetPending'

            ;
            (bm.trigger_sig)("BM_ContentAttribs:" .. l_0_14[l_0_11], l_0_4)
          end
          l_0_12 = true
        end
      end
      do
        -- DECOMPILER ERROR at PC125: Confused about usage of register: R1 in 'UnsetPending'

        if l_0_12 == false then
          return mp.CLEAN
        end
        return mp.INFECTED
      end
    end
  end
end

