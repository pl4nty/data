-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9cb3f38fabae\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_5, l_0_8, l_0_10, l_0_11, l_0_13, l_0_15, l_0_16 = nil, nil, nil
  else
  end
  if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[4]).utf8p2 == "" or (this_sigattrlog[2]).matched) and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p1 ~= "" then
    local l_0_4, l_0_6, l_0_9, l_0_12, l_0_14, l_0_17 = (this_sigattrlog[4]).utf8p2, (this_sigattrlog[2]).utf8p1
    l_0_12 = this_sigattrlog
    l_0_12 = l_0_12[2]
    l_0_9 = l_0_12.utf8p2
    local l_0_7, l_0_18 = nil
  end
  do
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC60: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC64: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_4 == nil or l_0_4 == "" or l_0_6 == nil or l_0_6 == "" then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC70: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC75: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

    if IsExcludedByCmdlineMacOS(l_0_9) or IsExcludedByImagePathMacOS(l_0_6) or IsPersistenceExcludedMacOS(l_0_4, l_0_6, false) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC92: Confused about usage of register: R1 in 'UnsetPending'

    if not IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_6) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_19 = nil
    if l_0_4:match("[^/]*$") ~= nil and l_0_4:match("[^/]*$") ~= "" and IsKeyInRollingQueue("MAC_PERSIST_PROG_PATHS", l_0_4:match("[^/]*$"), true) then
      local l_0_20 = nil
      if GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_4:match("[^/]*$")) ~= nil and #GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_4:match("[^/]*$")) > 0 then
        for l_0_24,l_0_25 in ipairs(GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_4:match("[^/]*$"))) do
          local l_0_21, l_0_22, l_0_23 = nil
          -- DECOMPILER ERROR at PC127: Confused about usage of register: R9 in 'UnsetPending'

          -- DECOMPILER ERROR at PC135: Confused about usage of register: R9 in 'UnsetPending'

          if SuspMacPathsToMonitor(l_0_15.value, true) then
            (bm.add_related_string)("persisted_path", l_0_15.value, bm.RelatedStringBMReport)
            return mp.INFECTED
          end
        end
      end
    end
    do
      return mp.CLEAN
    end
  end
end

