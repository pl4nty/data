-- Threat: !InfrastructureShared
-- Name: 95b39109a48a
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level <= MpCommon.SECURITY_MANDATORY_HIGH_RID then
  local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0.ppid)
  if l_0_1.IntegrityLevel > l_0_0.integrity_level then
    local l_0_2
    for l_0_3 = 1, mp.SIGATTR_LOG_SZ do
      if sigattr_tail[l_0_3].matched then
        if sigattr_tail[l_0_3].attribute == 16393 then
          l_0_2 = sigattr_tail[l_0_3].utf8p2
        elseif sigattr_tail[l_0_3].attribute == 16384 then
          l_0_2 = sigattr_tail[l_0_3].utf8p1
        else
          l_0_2 = nil
        end
        if l_0_2 ~= nil then
          local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_2)
          for l_0_5, l_0_6 in ipairs(l_0_4) do
            l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
            if sysio.IsFileExists(l_0_6) then
              bm.add_related_file(l_0_6)
            end
          end
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
