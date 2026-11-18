-- Threat: !InfrastructureShared
-- Name: 19b3ac934fa9
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = bm.get_current_process_startup_info()
  if l_0_0.integrity_level == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
    local l_0_1 = this_sigattrlog[1].utf8p2
    if l_0_1 ~= nil and string.len(l_0_1) > 2 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
