-- Threat: !InfrastructureShared
-- Name: 3a3b316a2403a
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.ppid and l_0_3.image_path then
      local l_0_4 = string.lower(l_0_3.image_path)
      if string.find(l_0_4, "tomcat", 1, true) then
        local l_0_5 = bm.get_current_process_startup_info()
        if l_0_5 then
          local l_0_6 = mp.GetProcessCommandLine(l_0_5.ppid)
          local l_0_7, l_0_8 = MpCommon.StringRegExpSearch("(?i)(?:FromBase64String\\(\\s*['\"]+|\\s+-enc\\s+|\\s+-e\\s+|\\s+-encodedcommand\\s+)([^\\s'\"\\)]{35,})", l_0_6)
          if l_0_7 then
            local l_0_9 = MpCommon.Base64Decode(l_0_8)
            if l_0_9 and string.find(l_0_9, "SAP Business One ServerTools", 1, true) then
              return mp.CLEAN
            end
          end
        end
        bm.add_related_string("Recent_Threats", GetRollingQueueAsHashTable("RecentThreatsOnMachine"), bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
