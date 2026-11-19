-- Threat: !InfrastructureShared
-- Name: 19b3378537b0
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0
  l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 == nil or l_0_0 == "" then
    return mp.CLEAN
  end
  if string.find(l_0_0, "-k", 1, true) or string.find(l_0_0, "UnistackSvcGroup", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = bm.get_current_process_startup_info()
  if l_0_1.integrity_level < MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
    local l_0_2, l_0_3 = bm.get_process_relationships()
    for l_0_4, l_0_5 in ipairs(l_0_2) do
      if l_0_5.image_path ~= nil and mp.bitand(l_0_5.reason_ex, 1) == 1 and string.find(l_0_5.image_path, "windows\\system32\\svchost.exe", 1, true) then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
