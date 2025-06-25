-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11ab344132c30\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" then
    local l_0_0, l_0_1, l_0_4, l_0_6, l_0_7, l_0_8, l_0_10, l_0_12, l_0_13, l_0_14, l_0_16, l_0_17 = nil, nil, nil
  else
  end
  if (not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil or (this_sigattrlog[5]).utf8p1 == "" or (this_sigattrlog[2]).matched) and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p1 ~= "" and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_2, l_0_5, l_0_9, l_0_11, l_0_15, l_0_18 = (this_sigattrlog[5]).utf8p1, (this_sigattrlog[2]).utf8p1
    l_0_11 = this_sigattrlog
    l_0_11 = l_0_11[2]
    l_0_9 = l_0_11.utf8p2
    local l_0_3, l_0_19 = nil
  end
  do
    -- DECOMPILER ERROR at PC69: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

    if IsExcludedByCmdlineMacOS(l_0_9) or IsExcludedByImagePathMacOS(l_0_5) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC81: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC85: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_2 == nil or l_0_2 == "" or l_0_5 == nil or l_0_5 == "" or (string.find)(l_0_2, "/system/", 1, true) == 1 or (string.find)(l_0_2, ".app/contents/", 1, true) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC115: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC123: Confused about usage of register: R0 in 'UnsetPending'

    if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", (string.lower)(l_0_5)) then
      (bm.trigger_sig)("AdhocPersistMacOS", l_0_2)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

