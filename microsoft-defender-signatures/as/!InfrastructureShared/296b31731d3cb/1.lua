-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\296b31731d3cb\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
local l_0_2 = nil
if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p2 then
  l_0_2 = (this_sigattrlog[12]).utf8p2
end
if l_0_0 then
  for l_0_6,l_0_7 in ipairs(l_0_0) do
    if l_0_7.ppid and l_0_7.image_path then
      local l_0_8 = (string.lower)(l_0_7.image_path)
      if (string.find)(l_0_8, "w3wp", 1, true) then
        local l_0_9 = (add_parents_mp())
        local l_0_10 = nil
        for l_0_14,l_0_15 in ipairs(l_0_9) do
          if l_0_15.ImagePath then
            local l_0_16 = (string.lower)(l_0_15.ImagePath)
            if contains(l_0_16, "onedrive") then
              do
                do
                  l_0_10 = true
                  do break end
                  -- DECOMPILER ERROR at PC64: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC64: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC64: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC64: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC64: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
        if not l_0_10 then
          return mp.CLEAN
        end
        local l_0_17 = GetRollingQueueAsHashTable("RecentThreatsOnMachine")
        ;
        (bm.add_related_string)("Recent_Threats", l_0_17, bm.RelatedStringBMReport)
        if l_0_2 then
          l_0_2 = (string.lower)(l_0_2)
          if (string.find)(l_0_2, "-ap \"sharepoint", 1, true) then
            (bm.trigger_sig)("SuspSharepointSession", safeJsonDeserialize(l_0_17))
          end
          local l_0_18, l_0_19 = (MpCommon.StringRegExpSearch)("-ap\\s+\\\"[^\\\"]+", l_0_2)
          if (string.find)(l_0_2, "powershell", 1, true) and l_0_19 then
            local l_0_20 = contains
            local l_0_21 = l_0_19
            local l_0_22 = {}
            -- DECOMPILER ERROR at PC124: No list found for R16 , SetList fails

            -- DECOMPILER ERROR at PC128: Overwrote pending register: R14 in 'AssignReg'

            -- DECOMPILER ERROR at PC129: Overwrote pending register: R14 in 'AssignReg'

            if l_0_20 then
              return l_0_20
            end
          end
        end
        do
          local l_0_23 = (bm.get_current_process_startup_info)()
          -- DECOMPILER ERROR at PC138: Overwrote pending register: R14 in 'AssignReg'

          if l_0_23 then
            local l_0_24 = (mp.GetProcessCommandLine)(l_0_20)
            local l_0_25, l_0_26 = (MpCommon.StringRegExpSearch)("(?i)(?:FromBase64String\\(\\s*[\'\"]+|\\s+-enc\\s+|\\s+-e\\s+|\\s+-encodedcommand\\s+)([^\\s\'\"\\)]{35,})", l_0_24)
            -- DECOMPILER ERROR at PC149: Overwrote pending register: R17 in 'AssignReg'

            if l_0_25 then
              local l_0_27 = (MpCommon.Base64Decode)("wiz")
              if l_0_27 and (string.find)(l_0_27, "ErrorActionPreference", 1, true) then
                return mp.CLEAN
              end
            end
          end
          do
            do
              do return mp.INFECTED end
              -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end
return mp.CLEAN

