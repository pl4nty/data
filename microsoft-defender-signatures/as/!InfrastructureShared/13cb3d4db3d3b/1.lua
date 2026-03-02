-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13cb3d4db3d3b\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC18: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or isnull((string.lower)(normalize_path((this_sigattrlog[4]).utf8p1))) then
    return mp.CLEAN
  end
  local l_0_3 = nil
  -- DECOMPILER ERROR at PC66: Overwrote pending register: R1 in 'AssignReg'

  if not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p1 == nil or isnull(nil) then
    return mp.CLEAN
  end
  getDirectoryPath = function(l_1_0)
  -- function num : 0_0
  local l_1_1, l_1_2 = l_1_0:match, l_1_0
  do
    local l_1_3 = "^(.*)[/\\][^/\\]+$"
    do return l_1_1(l_1_2, l_1_3) end
    -- DECOMPILER ERROR at PC4: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

  local l_0_4 = nil
  if isnull(getDirectoryPath((string.lower)(l_0_3))) or #getDirectoryPath((string.lower)(l_0_3)) <= 3 then
    return mp.CLEAN
  end
  local l_0_5 = nil
  if isnull(getDirectoryPath((string.lower)(l_0_4))) or #getDirectoryPath((string.lower)(l_0_4)) <= 3 then
    return mp.CLEAN
  end
  if l_0_5 ~= getDirectoryPath((string.lower)(l_0_4)) then
    return mp.CLEAN
  end
  if isKnownCleanPathContext(l_0_5) then
    return mp.CLEAN
  end
  if (mp.IsKnownFriendlyFile)(l_0_4, true, true) == true then
    return mp.CLEAN
  end
  local l_0_6 = nil
  if (bm.get_current_process_startup_info)() == nil or ((bm.get_current_process_startup_info)()).ppid == nil then
    return mp.CLEAN
  end
  local l_0_7 = nil
  local l_0_8 = ((bm.get_current_process_startup_info)()).ppid
  AppendToRollingQueueNamespaced(l_0_3, "Posilod", "CreatedByPPID", l_0_8)
  -- DECOMPILER ERROR at PC156: Confused about usage of register: R6 in 'UnsetPending'

  AppendToRollingQueueNamespaced(l_0_4, "Posilod", "CreatedByPPID", l_0_8)
  return mp.INFECTED
end

