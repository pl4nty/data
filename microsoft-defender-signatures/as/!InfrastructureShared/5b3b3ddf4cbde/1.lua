-- Threat: !InfrastructureShared
-- Name: 5b3b3ddf4cbde
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_0 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_1 = sigattr_tail[l_0_0]
  if l_0_1.matched and l_0_1.attribute == 16393 and l_0_1.utf8p1 then
    local l_0_2 = string.lower(l_0_1.utf8p1)
    local l_0_3 = false
    local l_0_4 = "hklm\\\\software(\\\\policies)?\\\\microsoft\\\\(windows defender|microsoft antimalware)\\\\exclusions\\\\(path|extensions)"
    l_0_3, _ = MpCommon.StringRegExpSearch(l_0_4, l_0_2)
    if l_0_3 then
      local l_0_5 = bm.get_current_process_startup_info()
      if not l_0_5 or not l_0_5.ppid then
        return mp.CLEAN
      end
      local l_0_6 = false
      local l_0_7 = mp.GetProcessCommandLine(l_0_5.ppid)
      if l_0_7 and contains(l_0_7, "gpsvc") then
        l_0_6 = true
      else
        local l_0_8 = {
          {
            "svchost.exe",
            "GPSvc"
          }
        }
        l_0_6 = checkParentCmdlineCaseInsensitive(l_0_5.ppid, l_0_8, 5)
      end
      local l_0_9 = l_0_2:match("\\\\(.*)")
      local l_0_10 = IsKeyInRollingQueue("gpo_broad_exclusion", l_0_9, true)
      local l_0_11 = bm.get_imagepath() or l_0_5.image_path
      if not l_0_11 then
        return mp.CLEAN
      end
      if l_0_11 and contains(l_0_11, "svchost.exe") then
        local l_0_12 = l_0_2
        local l_0_13 = 86400
        local l_0_14 = MpCommon.AtomicCounterValue(l_0_12)
        local l_0_15 = {}
        l_0_15.has_gpsvc_cmd = tostring(l_0_6)
        l_0_15.has_rq_gpo = tostring(l_0_10)
        l_0_15.count = l_0_14
        l_0_15.key = l_0_12
        if not l_0_14 then
          MpCommon.AtomicCounterSet(l_0_12, 1, l_0_13)
          add_parents()
          bm.add_related_string("AppliedThroughPolicy", safeJsonSerialize(l_0_15), bm.RelatedStringBMReport)
        elseif l_0_14 and l_0_14 < 5 then
          MpCommon.AtomicCounterAdd(l_0_12, 1)
          add_parents()
          bm.add_related_string("AppliedThroughPolicy", safeJsonSerialize(l_0_15), bm.RelatedStringBMReport)
        else
          MpCommon.AtomicCounterAdd(l_0_12, 1)
          return mp.CLEAN
        end
        if l_0_10 then
          return mp.INFECTED
        else
          bm.trigger_sig("Wide_Exclusion_Existing_Policy", l_0_2)
          return mp.CLEAN
        end
      else
        add_parents()
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
