-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3a3b316a2403a\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
if l_0_0 then
  for l_0_5,l_0_6 in ipairs(l_0_0) do
    if l_0_6.ppid and l_0_6.image_path then
      local l_0_7 = (string.lower)(l_0_6.image_path)
      if (string.find)(l_0_7, "tomcat", 1, true) then
        local l_0_8 = (bm.get_current_process_startup_info)()
        if l_0_8 then
          local l_0_9 = (mp.GetProcessCommandLine)(l_0_8.ppid)
          local l_0_10, l_0_11 = (MpCommon.StringRegExpSearch)("(?i)(?:FromBase64String\\(\\s*[\'\"]+|\\s+-enc\\s+|\\s+-e\\s+|\\s+-encodedcommand\\s+)([^\\s\'\"\\)]{35,})", l_0_9)
          if l_0_10 then
            local l_0_12 = (MpCommon.Base64Decode)(l_0_11)
            if l_0_12 and (string.find)(l_0_12, "SAP Business One ServerTools", 1, true) then
              return mp.CLEAN
            end
          end
        end
        do
          do
            ;
            (bm.add_related_string)("Recent_Threats", GetRollingQueueAsHashTable("RecentThreatsOnMachine"), bm.RelatedStringBMReport)
            do return mp.INFECTED end
            -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end
return mp.CLEAN

