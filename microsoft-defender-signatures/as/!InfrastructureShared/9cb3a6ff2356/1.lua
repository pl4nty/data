-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9cb3a6ff2356\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = (MpCommon.PathToWin32Path)(l_0_0)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(l_0_1)
  if checkFileLastWriteTime(l_0_1, 3600) ~= false then
    return mp.CLEAN
  end
  local l_0_2, l_0_3 = (mp.GetMotwZoneForFile)(l_0_1)
  if l_0_3 ~= nil and l_0_3 >= 3 then
    (bm.add_related_file)(l_0_1)
    return mp.INFECTED
  end
  return mp.CLEAN
end

