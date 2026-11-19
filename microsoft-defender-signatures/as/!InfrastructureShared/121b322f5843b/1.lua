-- Threat: !InfrastructureShared
-- Name: 121b322f5843b
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level <= MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0.ppid)
  if l_0_1.IntegrityLevel > l_0_0.integrity_level then
    local l_0_2
    for l_0_3 = 1, mp.SIGATTR_LOG_SZ do
      if sigattr_tail[l_0_3].matched and sigattr_tail[l_0_3].attribute == 16393 then
        l_0_2 = sigattr_tail[l_0_3].utf8p2
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
    if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
      l_0_2 = this_sigattrlog[7].utf8p2
    elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
      l_0_2 = this_sigattrlog[8].utf8p2
    elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
      l_0_2 = this_sigattrlog[9].utf8p2
    elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
      l_0_2 = this_sigattrlog[10].utf8p1
    elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
      l_0_2 = this_sigattrlog[11].utf8p1
    end
    if l_0_2 ~= nil then
      local l_0_7 = mp.GetExecutablesFromCommandLine(l_0_2)
      for l_0_8, l_0_9 in ipairs(l_0_7) do
        l_0_9 = mp.ContextualExpandEnvironmentVariables(l_0_9)
        if sysio.IsFileExists(l_0_9) then
          mp.ReportLowfi(l_0_9, 2668059089)
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
