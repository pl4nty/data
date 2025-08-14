-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3bb24c01d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if MpCommon.SECURITY_MANDATORY_MEDIUM_RID < l_0_0.integrity_level then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetProcessElevationAndIntegrityLevel)(l_0_0.ppid)
if MpCommon.SECURITY_MANDATORY_MEDIUM_RID < l_0_1.IntegrityLevel then
  return mp.CLEAN
end
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_2 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
  if (string.find)(l_0_2, "\\program files", 1, true) or (string.find)(l_0_2, "regsvr32.exe", 1, true) or (string.find)(l_0_2, "rundll32.exe", 1, true) or (string.find)(l_0_2, "svchost.exe", 1, true) or (string.find)(l_0_2, "onedrive", 1, true) or (string.find)(l_0_2, "\\google", 1, true) or (string.find)(l_0_2, "msiexec.exe", 1, true) or (string.find)(l_0_2, "\\yandex", 1, true) or (string.find)(l_0_2, "dllhost.exe", 1, true) or (string.find)(l_0_2, "\\mail.ru", 1, true) or (string.find)(l_0_2, "\\steamapps\\", 1, true) or (string.find)(l_0_2, "service.exe", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = (this_sigattrlog[2]).utf8p2
  if (sysio.IsFileExists)(l_0_3) then
    local l_0_4 = (string.lower)(l_0_3)
    if (string.find)(l_0_4, "program files", 1, true) or (string.find)(l_0_4, ".ocx", 1, true) then
      return mp.CLEAN
    end
    if (mp.IsKnownFriendlyFile)(l_0_3, true, false) == false then
      (bm.add_related_file)(l_0_3)
      if (versioning.IsSeville)() and (versioning.GetCloudBlockLevel)() >= 4 then
        TrackPidAndTechniqueBM("BM", "T1559.001", "interprocess_com_b")
      end
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

