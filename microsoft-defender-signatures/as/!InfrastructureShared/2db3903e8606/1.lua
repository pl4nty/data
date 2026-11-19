-- Threat: !InfrastructureShared
-- Name: 2db3903e8606
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  local l_0_4 = string.lower(l_0_3.image_path)
  if string.find(l_0_4, "perfmon.exe", 1, true) or string.find(l_0_4, "mmc.exe", 1, true) or string.find(l_0_4, "werfault.exe", 1, true) or string.find(l_0_4, "wermgr.exe", 1, true) or string.find(l_0_4, "control.exe", 1, true) or string.find(l_0_4, "openwith.exe", 1, true) or string.find(l_0_4, "iexplore.exe", 1, true) or string.find(l_0_4, "msedge.exe", 1, true) or string.find(l_0_4, "\\chrome", 1, true) or string.find(l_0_4, "\\opera", 1, true) or string.find(l_0_4, "browser", 1, true) or string.find(l_0_4, "\\program files", 1, true) or string.find(l_0_4, "\\tencent", 1, true) or string.find(l_0_4, "\\sogou", 1, true) or string.find(l_0_4, "\\qq", 1, true) or string.find(l_0_4, "\\yandex", 1, true) or string.find(l_0_4, "\\360se", 1, true) or string.find(l_0_4, "launchwinapp.exe", 1, true) or string.find(l_0_4, "sgtool.exe", 1, true) or string.find(l_0_4, "\\vivaldi", 1, true) or string.find(l_0_4, "\\onedrive", 1, true) or string.find(l_0_4, "firefox.exe", 1, true) then
    return mp.CLEAN
  end
  local l_0_5 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_3.ppid)
  local l_0_6 = mp.bitand(l_0_3.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_6 == bm.RELATIONSHIP_CREATED and l_0_5.IntegrityLevel == MpCommon.SECURITY_MANDATORY_HIGH_RID then
    bm.add_related_process(l_0_3.ppid)
    return mp.INFECTED
  end
end
return mp.CLEAN
