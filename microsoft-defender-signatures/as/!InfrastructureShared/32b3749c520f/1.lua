-- Threat: !InfrastructureShared
-- Name: 32b3749c520f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1, l_0_2 = l_0_0:match("(.*)|(.*)")
  if l_0_1 and l_0_2 then
    bm.add_related_string("serverName", l_0_1, bm.RelatedStringBMReport)
    bm.add_related_string("tamperingAlert", l_0_2, bm.RelatedStringBMReport)
    local l_0_3 = bm.get_current_process_startup_info()
    if l_0_3 then
      bm.add_related_string("appName", getWebApplicationType(l_0_3.ppid), bm.RelatedStringBMReport)
    end
    reportSessionInformationInclusive()
    bm_AddRelatedFileFromCommandLine("bm")
    add_parents()
    local l_0_4 = 30
    local l_0_5 = "PFServers"
    local l_0_6 = GetPidFromParentImagePath(l_0_1)
    if l_0_6 then
      local l_0_7, l_0_8 = startTrackingApp(l_0_6, l_0_1, l_0_5, "PFApp_Parent")
      if not l_0_7 then
        l_0_8.SignatureName = "PFATamper.C"
        l_0_8.ProcessName = l_0_1
        bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_8))
      else
        local l_0_9 = "Tampering[" .. l_0_3.ppid:match("pid:(%d+)") .. "][" .. l_0_2 .. "]"
        IncreaseProcessAnomalyScore(l_0_3.ppid, l_0_4, l_0_9, "PFApp_Parent")
        if next(l_0_8) and l_0_8.IsNewApp then
          l_0_8.SignatureName = "PFATamper.C"
          l_0_8.ProcessName = l_0_1
          l_0_8.Score = l_0_4
          bm.trigger_sig("SetProcessAttrib", safeJsonSerialize(l_0_8))
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
