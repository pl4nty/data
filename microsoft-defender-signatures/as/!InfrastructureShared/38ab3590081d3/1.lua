-- Threat: !InfrastructureShared
-- Name: 38ab3590081d3
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
    local l_0_4 = "hklm\\\\software(\\\\policies)?\\\\microsoft\\\\(windows defender|microsoft antimalware)\\\\exclusions\\\\processes\\\\\\\\"
    l_0_3, _ = MpCommon.StringRegExpSearch(l_0_4, l_0_2)
    if l_0_3 then
      local l_0_5 = bm.get_current_process_startup_info()
      if not l_0_5 or not l_0_5.ppid then
        return mp.CLEAN
      end
      local l_0_6 = bm.get_imagepath() or l_0_5.image_path
      if not l_0_6 then
        return mp.CLEAN
      end
      if l_0_6 and contains(l_0_6, "svchost.exe") then
        local l_0_7 = versioning.GetOrgID()
        if l_0_7 then
          l_0_7 = l_0_7:lower()
          l_0_7 = crypto.Sha1Buffer(l_0_7, 0, #l_0_7)
          if l_0_7 == "f9a615dbb6affe49419dfe781bff51340f37e8fa" or l_0_7 == "ebcfa46ce0defff07d341c8cca024ee1e826a9fa" or l_0_7 == "5199817d05cd84cdcda32b87524adcafaf4c60bf" then
            return mp.CLEAN
          end
        end
        local l_0_8 = l_0_2
        local l_0_9 = 86400
        local l_0_10 = MpCommon.AtomicCounterValue(l_0_8)
        local l_0_11 = {}
        l_0_11.count = l_0_10
        l_0_11.key = l_0_8
        if not l_0_10 then
          l_0_11.count = 0
          MpCommon.AtomicCounterSet(l_0_8, 1, l_0_9)
          add_parents()
          bm.add_related_string("AppliedThroughPolicy", safeJsonSerialize(l_0_11), bm.RelatedStringBMReport)
          return mp.INFECTED
        elseif l_0_10 and l_0_10 < 5 then
          MpCommon.AtomicCounterAdd(l_0_8, 1)
          add_parents()
          bm.add_related_string("AppliedThroughPolicy", safeJsonSerialize(l_0_11), bm.RelatedStringBMReport)
          return mp.INFECTED
        else
          MpCommon.AtomicCounterAdd(l_0_8, 1)
          return mp.CLEAN
        end
      else
        add_parents()
        local l_0_12, l_0_13 = pcall(reportBmInfo)
        if not l_0_12 and l_0_13 then
          bm.add_related_string("bmInfoFailReason", tostring(l_0_13), bm.RelatedStringBMReport)
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
