-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21ab3ed7a7ef7\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
    local l_0_0, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 then
    do
      if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 and (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 and (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 and (this_sigattrlog[4]).matched then
        local l_0_1, l_0_3 = , (this_sigattrlog[4]).utf8p2
      end
      -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

      -- DECOMPILER ERROR at PC61: Confused about usage of register: R1 in 'UnsetPending'

      if l_0_3 then
        local l_0_4 = nil
        if isnull((string.match)(l_0_3, "Uri=([^;]+)")) then
          return mp.CLEAN
        end
        local l_0_5 = nil
        if (string.match)((string.match)(l_0_3, "Uri=([^;]+)"), "^https?://") then
          local l_0_6, l_0_7 = , {SIG_CONTEXT = "BM", CONTENT_SOURCE = "MAPVIEW_QUEUEUSERAPC"}
          if (mp.CheckUrl)((string.match)(l_0_3, "Uri=([^;]+)")) == 1 and (string.match)(l_0_3, "Uri=([^;]+)") == 1 then
            return mp.CLEAN
          end
          local l_0_8 = nil
          local l_0_9 = nil
          if ((SafeGetUrlReputation({l_0_6}, l_0_7, false, 3000)).urls)[l_0_6] and (((SafeGetUrlReputation({l_0_6}, l_0_7, false, 3000)).urls)[l_0_6]).determination == 2 and (((SafeGetUrlReputation({l_0_6}, l_0_7, false, 3000)).urls)[l_0_6]).confidence >= 60 then
            local l_0_10 = nil
            if not pcall(string.match, l_0_4, "vmbaseaddress:(%d+)") or isnull(R10_PC125) then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC133: Overwrote pending register: R10 in 'AssignReg'

            local l_0_11, l_0_12 = nil
            if not pcall(R10_PC125, l_0_4, "vmregionsize:(%d+)") or isnull(R12_PC141) then
              return mp.CLEAN
            end
            ;
            (bm.add_related_string)(R12_PC141, R13_PC153, bm.RelatedStringBMReport)
            -- DECOMPILER ERROR at PC156: Overwrote pending register: R12 in 'AssignReg'

            ;
            (bm.add_related_string)(R12_PC141, R13_PC153, bm.RelatedStringBMReport)
            -- DECOMPILER ERROR at PC163: Overwrote pending register: R12 in 'AssignReg'

            -- DECOMPILER ERROR at PC164: Overwrote pending register: R13 in 'AssignReg'

            ;
            (bm.add_related_string)(R12_PC141, R13_PC153, bm.RelatedStringBMReport)
            return mp.INFECTED
          end
        end
      end
      do
        return mp.CLEAN
      end
    end
  end
end

