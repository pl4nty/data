-- Threat: !InfrastructureShared
-- Name: 2db31bed458f
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0
  l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 == nil then
    return mp.CLEAN
  end
  if string.find(l_0_0, "-k", 1, true) or string.find(l_0_0, "UnistackSvcGroup", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = bm.get_imagepath()
  if l_0_1 ~= nil then
    local l_0_2 = string.lower(string.sub(l_0_1, -4))
    if l_0_2 == ".dll" then
      return mp.CLEAN
    end
  end
  local l_0_3 = bm.get_current_process_startup_info()
  if l_0_3.integrity_level < MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
    local l_0_4, l_0_5 = bm.get_process_relationships()
    for l_0_6, l_0_7 in ipairs(l_0_4) do
      if l_0_7.image_path ~= nil and mp.bitand(l_0_7.reason_ex, 1) == 1 and string.find(l_0_7.image_path, "windows\\system32\\svchost.exe", 1, true) then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
