-- Threat: !InfrastructureShared
-- Name: 296b31731d3cb
-- Type: 21
-- Includes: BMLuaLib, AppomalyHelpers, LuaFuncHelper

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 then
  l_0_2 = this_sigattrlog[12].utf8p2
end
if l_0_0 then
  for l_0_3, l_0_4 in ipairs(l_0_0) do
    if l_0_4.ppid and l_0_4.image_path then
      local l_0_5 = string.lower(l_0_4.image_path)
      if string.find(l_0_5, "w3wp", 1, true) then
        local l_0_6 = add_parents_mp()
        local l_0_7
        for l_0_8, l_0_9 in ipairs(l_0_6) do
          if l_0_9.ImagePath then
            local l_0_10 = string.lower(l_0_9.ImagePath)
            if contains(l_0_10, "onedrive") then
              l_0_7 = true
              break
            end
          end
        end
        if not l_0_7 then
          return mp.CLEAN
        end
        local l_0_11 = GetRollingQueueAsHashTable("RecentThreatsOnMachine")
        bm.add_related_string("Recent_Threats", l_0_11, bm.RelatedStringBMReport)
        if l_0_2 then
          l_0_2 = string.lower(l_0_2)
          if string.find(l_0_2, "-ap \"sharepoint", 1, true) then
            bm.trigger_sig("SuspSharepointSession", safeJsonDeserialize(l_0_11))
          end
          local l_0_12, l_0_13 = MpCommon.StringRegExpSearch("-ap\\s+\\\"[^\\\"]+", l_0_2)
          if string.find(l_0_2, "powershell", 1, true) and l_0_13 and contains(l_0_13, {"wiz"}) then
            return mp.CLEAN
          end
        end
        local l_0_14 = bm.get_current_process_startup_info()
        if l_0_14 then
          local l_0_15 = mp.GetProcessCommandLine(l_0_14.ppid)
          local l_0_16, l_0_17 = MpCommon.StringRegExpSearch("(?i)(?:FromBase64String\\(\\s*['\"]+|\\s+-enc\\s+|\\s+-e\\s+|\\s+-encodedcommand\\s+)([^\\s'\"\\)]{35,})", l_0_15)
          if l_0_16 then
            local l_0_18 = MpCommon.Base64Decode(l_0_17)
            if l_0_18 and string.find(l_0_18, "ErrorActionPreference", 1, true) then
              return mp.CLEAN
            end
          end
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
