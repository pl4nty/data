-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fdb33dac0332\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
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
  if checkFileLastWriteTime(l_0_1, 1800) == true then
    return mp.CLEAN
  end
  local l_0_2 = (mp.IsKnownFriendlyFile)(l_0_1, false, false)
  if l_0_2 == true then
    return mp.CLEAN
  end
  local l_0_3 = (bm.get_imagepath)()
  if l_0_3 == nil then
    return mp.CLEAN
  end
  l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  if checkFileLastWriteTime(l_0_3, 1800) == true then
    return mp.CLEAN
  end
  local l_0_4 = (mp.IsKnownFriendlyFile)(l_0_3, true, true)
  if not l_0_4 then
    return mp.CLEAN
  end
  ;
  (bm.add_related_file)(l_0_1)
  ;
  (mp.ReportLowfi)(l_0_1, 2924828722)
  local l_0_5 = (string.format)("loadedModule=%s", l_0_1)
  ;
  (bm.add_related_string)("ReferencePath", l_0_5, bm.RelatedStringBMReport)
  return mp.INFECTED
end

