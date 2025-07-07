-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\62b36a689bbd\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p1 ~= "" then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4 = nil
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

  if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) and (SuspMacPathsToMonitor(l_0_0, true) or (string.find)(l_0_0, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_0, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_0, "/Users/[^/]+/Desktop/", 1, false)) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

