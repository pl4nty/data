-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43b3781743fc\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = nil
  if StringEndsWith((string.lower)(l_0_0), "\\program files (x86)\\windowsinstallationassistant\\getcurrentdeploy.dll") or StringEndsWith((string.lower)(l_0_0), "\\program files\\windowsinstallationassistant\\getcurrentdeploy.dll") then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if (mp.IsKnownFriendlyFile)(l_0_2, false, false) == true then
    return mp.CLEAN
  end
  local l_0_4 = nil
  if (bm.get_imagepath)() == nil then
    return mp.CLEAN
  end
  if (MpCommon.PathToWin32Path)((bm.get_imagepath)()) == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R3 in 'UnsetPending'

  local l_0_5 = nil
  if (sysio.GetPEVersionInfo)((MpCommon.PathToWin32Path)((bm.get_imagepath)())) == nil or ((sysio.GetPEVersionInfo)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))).OriginalFilename == nil then
    return mp.CLEAN
  end
  if (string.lower)(((sysio.GetPEVersionInfo)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))).OriginalFilename) ~= "getcurrentrollback.exe" then
    return mp.CLEAN
  end
  local l_0_6 = nil
  if not (mp.IsKnownFriendlyFile)(l_0_5, true, true) then
    return mp.CLEAN
  end
  ;
  (bm.add_related_file)(l_0_2)
  ;
  (mp.ReportLowfi)(l_0_2, 2924828722)
  local l_0_7 = nil
  ;
  (bm.add_related_string)("ReferencePath", (string.format)("loadedModule=%s", l_0_2), bm.RelatedStringBMReport)
  return mp.INFECTED
end

