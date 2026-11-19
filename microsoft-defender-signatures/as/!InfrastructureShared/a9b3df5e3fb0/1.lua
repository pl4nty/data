-- Threat: !InfrastructureShared
-- Name: a9b3df5e3fb0
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if string.find(l_0_0, ".bat", 1, true) or string.find(l_0_0, ".cmd", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = bm.get_current_process_startup_info()
  if l_0_1.integrity_level == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
    return mp.INFECTED
  end
end
return mp.CLEAN
