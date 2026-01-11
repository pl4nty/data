-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2efb379b8ae0d\1.luac 

-- params : ...
-- function num : 0
do
  local l_0_0, l_0_1 = (bm.get_process_relationships)()
  if l_0_0 then
    for l_0_5,l_0_6 in ipairs(l_0_0) do
      if l_0_6.ppid and l_0_6.image_path then
        local l_0_7 = (string.lower)(l_0_6.image_path)
        if (MpCommon.StringRegExpSearch)("(httpd.exe|tomcat|nginx|w3wp|java|apache)", l_0_7) and (mp.bitand)(l_0_6.reason_ex, 1) == 1 then
          local l_0_8, l_0_9 = pcall(reportBmInfo)
          if not l_0_8 and l_0_9 then
            (bm.add_related_string)("bmInfoFailReason", tostring(l_0_9), bm.RelatedStringBMReport)
          end
          local l_0_10 = (bm.get_current_process_startup_info)()
          if not l_0_10 or not l_0_10.ppid then
            return mp.CLEAN
          end
          do
            local l_0_11, l_0_12 = (mp.GetProcessCommandLine)(l_0_10.ppid) or ""
            local l_0_13 = nil
            local l_0_14 = nil
            local l_0_15 = table_dedup(multi_match_regex(l_0_13, "((ftp|http[s]?)://[^\\\"\\s\\\']+)"))
            for l_0_19,l_0_20 in ipairs(l_0_15) do
              local l_0_16 = {}
              -- DECOMPILER ERROR at PC80: Confused about usage of register: R19 in 'UnsetPending'

              if UrlGrader(R19_PC80, "Behavior:Win32/PFApp_SuspCmd.A", false) < 0 then
                return mp.CLEAN
              end
              if UrlGrader(R19_PC80, "Behavior:Win32/PFApp_SuspCmd.A", false) ~= 0 then
                l_0_16[l_0_21] = R19_PC80
              end
            end
            -- DECOMPILER ERROR at PC95: Confused about usage of register: R14 in 'UnsetPending'

            local l_0_22, l_0_23 = , safeJsonSerialize(l_0_16, 150, nil, true)
            if not (string.find)(l_0_23, "Susfile_extension", 1, true) then
              return mp.CLEAN
            end
            local l_0_24 = nil
            local l_0_25 = bm.add_related_string
            do
              l_0_25("URL_Info", l_0_23 or l_0_24, bm.RelatedStringBMReport)
              l_0_25 = IsDeviceHVA
              l_0_25 = l_0_25()
              if l_0_25 then
                l_0_25 = ExtractDeviceProperties
                l_0_25 = l_0_25()
                ;
                (bm.add_related_string)("HVA", l_0_25, bm.RelatedStringBMReport)
              end
              l_0_25 = mp
              l_0_25 = l_0_25.INFECTED
              do return l_0_25 end
              -- DECOMPILER ERROR at PC137: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC137: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC137: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC137: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC137: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC142: freeLocal<0 in 'ReleaseLocals'

end

