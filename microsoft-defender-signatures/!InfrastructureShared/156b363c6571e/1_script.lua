-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\156b363c6571e\1_luac 

-- params : ...
-- function num : 0
local l_0_2 = nil
if (this_sigattrlog[1]).matched then
  local l_0_0, l_0_1 = true
else
  do
    -- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC27: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC36: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC45: Overwrote pending register: R0 in 'AssignReg'

    if ((((this_sigattrlog[2]).matched and not (this_sigattrlog[4]).matched) or (this_sigattrlog[5]).matched) and not (this_sigattrlog[3]).matched) or IsSenseRelatedProc() == true then
      return mp.CLEAN
    end
    if ((string.lower)(l_0_2)):find("tamper", 1, true) then
      return mp.CLEAN
    end
    local l_0_3 = false
    local l_0_4 = 7200
    AppendToRollingQueue("TamperingHackTools", l_0_2, 1, l_0_4, 100)
    local l_0_5 = nil
    do
      if GetRollingQueueKeys("TamperingAlerts") ~= nil and type(GetRollingQueueKeys("TamperingAlerts")) == "table" then
        local l_0_6 = nil
        for l_0_10,l_0_11 in ipairs(l_0_6) do
          local l_0_7 = "["
          -- DECOMPILER ERROR at PC93: Confused about usage of register: R10 in 'UnsetPending'

          l_0_7 = l_0_7 .. "|" .. R10_PC93
        end
        -- DECOMPILER ERROR at PC97: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC105: Confused about usage of register: R5 in 'UnsetPending'

        if l_0_7 .. "]" ~= "[]" then
          (bm.add_related_string)("TamperingAlertsOnMachine", l_0_7 .. "]", bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("HackToolsOnMachine", l_0_2, bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("IsThreatDetection", l_0_3, bm.RelatedStringBMReport)
          add_parents()
          reportRelevantUntrustedEntities(0)
          reportAVExcludedEntities()
          return mp.INFECTED
        end
      end
      local l_0_12 = nil
      local l_0_13 = GetRollingQueueKeys("TamperingHackTools")
      local l_0_14 = "["
      for l_0_18,l_0_19 in ipairs(l_0_13) do
        local l_0_15 = 0
        -- DECOMPILER ERROR at PC144: Confused about usage of register: R12 in 'UnsetPending'

        l_0_14 = l_0_14 .. "|" .. "|"
        l_0_15 = l_0_15 + 1
      end
      l_0_14 = l_0_14 .. "]"
      -- DECOMPILER ERROR at PC152: Confused about usage of register: R7 in 'UnsetPending'

      if l_0_15 >= 3 then
        (bm.add_related_string)("HackToolsOnMachine", l_0_14, bm.RelatedStringBMReport)
        ;
        (bm.add_related_string)("IsThreatDetection", l_0_3, bm.RelatedStringBMReport)
        add_parents()
        reportRelevantUntrustedEntities(0)
        reportAVExcludedEntities()
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

