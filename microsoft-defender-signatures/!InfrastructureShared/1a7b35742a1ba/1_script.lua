-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1a7b35742a1ba\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC25: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[6]).matched or (this_sigattrlog[9]).matched then
      local l_0_1 = (this_sigattrlog[6]).utf8p2
    else
    end
    -- DECOMPILER ERROR at PC43: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[5]).matched or (this_sigattrlog[8]).matched then
        local l_0_2 = (this_sigattrlog[5]).utf8p1
      end
      local l_0_3 = nil
      local l_0_4 = "TamperingTracking"
      if (reportSessionInformation()).User and ((reportSessionInformation()).User).UserName then
        local l_0_5 = nil
        local l_0_6 = nil
        if GetRollingQueueSumOfValues(l_0_4 .. "-" .. ((reportSessionInformation()).User).UserName) and (GetRollingQueueSumOfValues(l_0_4 .. "-" .. ((reportSessionInformation()).User).UserName)).sum > 0 then
          local l_0_7 = nil
          ;
          (bm.add_related_string)("Tampering_Events_User", safeJsonSerialize(GetRollingQueue(l_0_6)), bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("DetectionType", l_0_3, bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("DetectionWeight", tostring(l_0_7.sum), bm.RelatedStringBMReport)
          reportRelevantUntrustedEntities(0)
          return mp.INFECTED
        end
      end
      do
        local l_0_8 = nil
        do
          if GetRollingQueueSumOfValues(l_0_4) and (GetRollingQueueSumOfValues(l_0_4)).sum > 0 then
            local l_0_9 = nil
            ;
            (bm.add_related_string)("Tampering_Events_Machine", safeJsonSerialize(GetRollingQueue(l_0_4)), bm.RelatedStringBMReport)
            ;
            (bm.add_related_string)("DetectionType", l_0_3, bm.RelatedStringBMReport)
            ;
            (bm.add_related_string)("DetectionWeight", tostring(l_0_9.sum), bm.RelatedStringBMReport)
            reportRelevantUntrustedEntities(0)
            return mp.INFECTED
          end
          return mp.CLEAN
        end
      end
    end
  end
end

