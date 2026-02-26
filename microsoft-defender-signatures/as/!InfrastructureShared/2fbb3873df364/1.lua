-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2fbb3873df364\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC18: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[17]).matched and (this_sigattrlog[17]).utf8p1 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  if isnull(l_0_0) then
    return mp.CLEAN
  end
  local l_0_2 = nil
  if isnull((bm.get_imagepath)()) then
    return mp.CLEAN
  end
  local l_0_3 = (string.lower)(normalize_path((bm.get_imagepath)()))
  local l_0_4 = "Posilod"
  local l_0_5, l_0_6 = nil, pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_0_3, l_0_4, "CreatedByPPID")
  if l_0_6 == true then
    l_0_5 = (MpCommon.RollingQueueQueryKeyNamespaced).value
  end
  if isnull(l_0_5) then
    return mp.CLEAN
  end
  local l_0_7 = nil
  -- DECOMPILER ERROR at PC75: Overwrote pending register: R6 in 'AssignReg'

  if pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_0_2, l_0_4, "CreatedByPPID") ~= true or isnull(nil) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC84: Confused about usage of register: R6 in 'UnsetPending'

  if l_0_5 == nil then
    return mp.INFECTED
  end
  return mp.CLEAN
end

