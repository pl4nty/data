-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\242b3b4af8efa\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil and (this_sigattrlog[7]).utf8p1 ~= "" then
    local l_0_0, l_0_1, l_0_4, l_0_6, l_0_7, l_0_9, l_0_12, l_0_13, l_0_15, l_0_16, l_0_17, l_0_19, l_0_21, l_0_22, l_0_24, l_0_26, l_0_29, l_0_30 = nil, nil, nil
  else
  end
  if (not (this_sigattrlog[8]).matched or (this_sigattrlog[8]).utf8p1 == nil or (this_sigattrlog[8]).utf8p1 == "" or (this_sigattrlog[4]).matched) and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 ~= "" then
    local l_0_2, l_0_5, l_0_8, l_0_10, l_0_14, l_0_18, l_0_20, l_0_23, l_0_25, l_0_27, l_0_31 = (this_sigattrlog[8]).utf8p1, (this_sigattrlog[4]).utf8p1
    l_0_10 = this_sigattrlog
    l_0_10 = l_0_10[4]
    l_0_8 = l_0_10.utf8p2
    local l_0_3, l_0_11, l_0_28, l_0_32 = nil
  end
  do
    -- DECOMPILER ERROR at PC69: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

    if IsExcludedByCmdlineMacOS(l_0_8) or IsExcludedByImagePathMacOS(l_0_5) or IsPersistenceExcludedMacOS(l_0_2, l_0_5, false) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC88: Confused about usage of register: R2 in 'UnsetPending'

    if l_0_8:find("mtxsetup -log /private/tmp/", 1, true) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC103: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_2:match("/Int%-Test%d+%.plist$") ~= nil and l_0_5:match("^/private/tmp/Int%-Test%d+/msp%-agent%-core$") ~= nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC115: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC121: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_2 == nil or l_0_2 == "" or l_0_5 == nil or l_0_5 == "" or (string.find)(l_0_2, "/System/", 1, true) == 1 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC134: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC140: Confused about usage of register: R1 in 'UnsetPending'

    if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_5) then
      (bm.add_related_file)(l_0_5)
      -- DECOMPILER ERROR at PC145: Confused about usage of register: R0 in 'UnsetPending'

      ;
      (bm.trigger_sig)("AdhocPersistMacOS", l_0_2)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

