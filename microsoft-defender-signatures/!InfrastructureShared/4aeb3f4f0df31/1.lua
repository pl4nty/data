-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4aeb3f4f0df31\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC22: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[3]).matched or (this_sigattrlog[4]).matched then
      local l_0_1 = this_sigattrlog[3]
    else
    end
    -- DECOMPILER ERROR at PC38: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[5]).matched or (this_sigattrlog[6]).matched then
        local l_0_2 = this_sigattrlog[5]
      else
      end
      -- DECOMPILER ERROR at PC54: Overwrote pending register: R0 in 'AssignReg'

      do
        if not (this_sigattrlog[7]).matched or (this_sigattrlog[8]).matched then
          local l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9 = this_sigattrlog[7]
        end
        -- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC66: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

        if isnull(l_0_3) or isnull(l_0_3.utf8p1) or isnull(l_0_3.utf8p2) or isnull(l_0_3.ppid) or isnull(l_0_3.timestamp) then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

        local l_0_10, l_0_11 = , (string.match)(l_0_3.utf8p1, "(%d+):(%d+)")
        if isnull(l_0_11) or tonumber(l_0_11) < 16 or tonumber(l_0_11) > 128 or isnull(R4_PC105) or tonumber(R4_PC105) < 258 then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC118: Overwrote pending register: R4 in 'AssignReg'

        local l_0_12 = nil
        -- DECOMPILER ERROR at PC121: Overwrote pending register: R4 in 'AssignReg'

        R4_PC105 = R4_PC105((string.match)(R4_PC105, "^([0-9]+);regionsize"))
        if R4_PC105 then
          R4_PC105 = mp
          R4_PC105 = R4_PC105.CLEAN
          return R4_PC105
        end
        R4_PC105 = tonumber
        R4_PC105 = R4_PC105((string.match)(R4_PC105, "^([0-9]+);regionsize"))
        -- DECOMPILER ERROR at PC134: Overwrote pending register: R4 in 'AssignReg'

        R4_PC105 = R4_PC105(R4_PC105)
        local l_0_13, l_0_14 = nil
        if not l_0_14 or R4_PC105.state_type ~= 257 and R4_PC105.state_type ~= 513 and R4_PC105.state_type ~= 1025 then
          return mp.CLEAN
        end
        local l_0_15 = nil
        local l_0_16 = (string.format)("size=%x;cur_protect=%x;alloc_protect=%x;state=%x", R4_PC105.size, R4_PC105.prot, R4_PC105.alloc_prot, R4_PC105.state_type)
        local l_0_17 = find_nearby_protectvmlocal_changes
        l_0_17 = l_0_17({l_0_10.utf8p1}, l_0_10.utf8p2)
        if l_0_17 < 4 then
          return mp.CLEAN
        end
        local l_0_18 = find_nearby_suspicious_traffic(l_0_10.timestamp)
        if l_0_18 == 0 or isnull(R11_PC177) then
          return mp.CLEAN
        end
        local l_0_19 = nil
        local l_0_20 = ""
        for l_0_24,l_0_25 in pairs(l_0_19) do
          local l_0_21 = R11_PC177
          -- DECOMPILER ERROR at PC189: Confused about usage of register: R16 in 'UnsetPending'

          if l_0_17 - l_0_21 <= R16_PC189.count and R16_PC189.count <= l_0_17 + l_0_21 then
            for l_0_30,l_0_31 in pairs(l_0_26.uri) do
              local l_0_27 = ""
              -- DECOMPILER ERROR at PC206: Confused about usage of register: R22 in 'UnsetPending'

              l_0_27 = (string.format)("%s;%s", l_0_27, R22_PC206)
            end
            -- DECOMPILER ERROR at PC213: Confused about usage of register: R17 in 'UnsetPending'

            l_0_20 = (string.format)("%s,{Host=%s;Connections:%d;Uris:%s}", l_0_20, l_0_25, l_0_26.count, (string.gsub)(l_0_27, "^,", ""))
          end
        end
        if isnull(l_0_20) then
          return mp.CLEAN
        end
        l_0_20 = (string.gsub)(l_0_20, "^,", "")
        local l_0_32, l_0_33 = l_0_21, pcall(bm.ReadProcMem, l_0_13, 256, l_0_10.ppid)
        if l_0_33 and not isnull(R15_PC255) then
          (bm.add_related_string)(R15_PC255, (string.format)("Hex=%s", tohex(R19_PC266)), bm.RelatedStringBMReport)
        else
          -- DECOMPILER ERROR at PC274: Overwrote pending register: R15 in 'AssignReg'

          ;
          (bm.add_related_string)(R15_PC255, "Could not read", bm.RelatedStringBMReport)
        end
        -- DECOMPILER ERROR at PC281: Overwrote pending register: R15 in 'AssignReg'

        ;
        (bm.add_related_string)(R15_PC255, (string.format)("ToggleCount=%d;Network={%s};ToggleMasks=%s;ToggleDetails={%s};VirtualQuery={%s}", l_0_17, l_0_20, l_0_10.utf8p1, l_0_10.utf8p2, l_0_16), bm.RelatedStringBMReport)
        -- DECOMPILER ERROR at PC295: Overwrote pending register: R15 in 'AssignReg'

        AddSuspiciousRegion(R15_PC255)
        -- DECOMPILER ERROR at PC298: Overwrote pending register: R15 in 'AssignReg'

        TriggerTargetedMemoryScan(R15_PC255, l_0_10.ppid)
        -- DECOMPILER ERROR at PC303: Overwrote pending register: R15 in 'AssignReg'

        ;
        (bm.request_SMS)(R15_PC255, "H+")
        return mp.INFECTED
      end
    end
  end
end

