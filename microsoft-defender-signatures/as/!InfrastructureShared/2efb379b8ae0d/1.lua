-- Threat: !InfrastructureShared
-- Name: 2efb379b8ae0d
-- Type: 21
-- Includes: BMLuaLib, AppomalyHelpers, LuaFuncHelper, HvaLookupHelpers

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.ppid and l_0_3.image_path then
      local l_0_4 = string.lower(l_0_3.image_path)
      if MpCommon.StringRegExpSearch("(httpd.exe|tomcat|nginx|w3wp|java|apache)", l_0_4) and mp.bitand(l_0_3.reason_ex, 1) == 1 then
        local l_0_5, l_0_6 = pcall(reportBmInfo)
        if not l_0_5 and l_0_6 then
          bm.add_related_string("bmInfoFailReason", tostring(l_0_6), bm.RelatedStringBMReport)
        end
        local l_0_7 = bm.get_current_process_startup_info()
        if not l_0_7 or not l_0_7.ppid then
          return mp.CLEAN
        end
        local l_0_8 = mp.GetProcessCommandLine(l_0_7.ppid) or ""
        local l_0_9 = "((ftp|http[s]?)://[^\\\"\\s\\']+)"
        local l_0_10 = table_dedup(multi_match_regex(l_0_8, l_0_9))
        local l_0_11 = {}
        for l_0_12, l_0_13 in ipairs(l_0_10) do
          local l_0_14, l_0_15 = UrlGrader(l_0_13, "Behavior:Win32/PFApp_SuspCmd.A", false)
          if l_0_14 < 0 then
            return mp.CLEAN
          end
          if l_0_14 ~= 0 then
            l_0_11[l_0_13] = l_0_15
          end
        end
        local l_0_16, l_0_17 = safeJsonSerialize(l_0_11, 150, nil, true)
        if not string.find(l_0_16, "Susfile_extension", 1, true) then
          return mp.CLEAN
        end
        bm.add_related_string("URL_Info", l_0_16 or l_0_17, bm.RelatedStringBMReport)
        if IsDeviceHVA() then
          local l_0_18 = ExtractDeviceProperties()
          bm.add_related_string("HVA", l_0_18, bm.RelatedStringBMReport)
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
