-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b337fe1794\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
    local l_0_0, l_0_1, l_0_3, l_0_6, l_0_8, l_0_9, l_0_11, l_0_13, l_0_14 = nil, nil, nil
  end
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p1 ~= "" then
    local l_0_2, l_0_4, l_0_7, l_0_10, l_0_12, l_0_15 = , (this_sigattrlog[2]).utf8p1
    l_0_10 = this_sigattrlog
    l_0_10 = l_0_10[2]
    l_0_7 = l_0_10.utf8p2
    local l_0_5, l_0_16 = nil
  end
  do
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_2 == nil or l_0_2 == "" or l_0_4 == nil or l_0_4 == "" then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC51: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

    if IsExcludedByCmdlineMacOS(l_0_7) or IsExcludedByImagePathMacOS(l_0_4) or IsPersistenceExcludedMacOS(l_0_2, l_0_4, false) then
      return mp.CLEAN
    end
    ExtendedSuspMacPathsToMonitor = function(l_1_0)
  -- function num : 0_0
  if SuspMacPathsToMonitor(l_1_0, true) then
    return true
  end
  if l_1_0:find("^/Users/[^/]+/Desktop/", 1, false) or l_1_0:find("^/Users/[^/]+/Documents/", 1, false) or l_1_0:find("^/Users/[^/]+/Downloads/", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+/[^/]+$", 1, false) or l_1_0:find("^/Library/[^/]+$", 1, false) or l_1_0:find("^/Library/[^/]+/[^/]+$", 1, false) then
    return true
  end
  return false
end

    -- DECOMPILER ERROR at PC75: Confused about usage of register: R1 in 'UnsetPending'

    if not IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_4) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_17 = nil
    if l_0_2:match("[^/]*$") ~= nil and l_0_2:match("[^/]*$") ~= "" and IsKeyInRollingQueue("MAC_PERSIST_PROG_PATHS", l_0_2:match("[^/]*$"), true) then
      local l_0_18 = nil
      if GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_2:match("[^/]*$")) ~= nil and #GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_2:match("[^/]*$")) > 0 then
        for l_0_22,l_0_23 in ipairs(GetRollingQueueKeyValues("MAC_PERSIST_PROG_PATHS", l_0_2:match("[^/]*$"))) do
          local l_0_19, l_0_20, l_0_21 = nil
          -- DECOMPILER ERROR at PC110: Confused about usage of register: R9 in 'UnsetPending'

          if ExtendedSuspMacPathsToMonitor(R9_PC110.value) then
            (bm.add_related_string)("persisted_path", R9_PC110.value, bm.RelatedStringBMReport)
            ;
            (bm.add_related_file)(R9_PC110.value)
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

