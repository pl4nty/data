-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\386b3821f0595\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = {}
local l_0_7 = {}
local l_0_8 = {}
local l_0_9 = {}
local l_0_10, l_0_11, l_0_12, l_0_13 = nil, nil, nil, nil
local l_0_14 = ""
local l_0_15 = false
local l_0_16 = 0
local l_0_17 = 0
local l_0_18 = {}
local l_0_19 = (bm.get_sig_count)()
for l_0_23 = 1, l_0_0 do
  local l_0_24 = (sigattr_tail[l_0_23]).attribute
  if l_0_24 == 16384 then
    local l_0_25 = ((sigattr_tail[l_0_23]).utf8p1):lower()
    if (MpCommon.IsSampled)(100, true, true, true) == true then
      local l_0_26 = (mp.crc32)(0, l_0_25, 1, #l_0_25)
      if l_0_1[l_0_26] ~= nil then
        (table.insert)(l_0_1[l_0_26], l_0_23)
      else
        local l_0_27 = {}
        -- DECOMPILER ERROR at PC61: No list found for R27 , SetList fails

      end
      do
        do
          -- DECOMPILER ERROR at PC66: Overwrote pending register: R28 in 'AssignReg'

          ;
          (bm.add_related_string)(l_0_23, "unchained", bm.RelatedStringBMReport)
          local l_0_28 = l_0_25:match("%.[^%.]+$")
          if l_0_28 ~= nil then
            l_0_28 = l_0_28 .. "\""
            if (mp.GetExtensionClass)(l_0_28) ~= 4 or isKnownRansomExtension(l_0_28) then
              local l_0_29 = (mp.crc32)(0, l_0_25, 1, #l_0_25)
              if l_0_1[l_0_29] ~= nil then
                (table.insert)(l_0_1[l_0_29], l_0_23)
              else
                local l_0_30 = {}
                -- DECOMPILER ERROR at PC109: No list found for R28 , SetList fails

                -- DECOMPILER ERROR at PC111: Overwrote pending register: R17 in 'AssignReg'

              end
            end
          end
          do
            -- DECOMPILER ERROR at PC112: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC112: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC112: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC112: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC112: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC112: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end
if l_0_17 < 5 then
  return mp.CLEAN
end
for l_0_34 = 1, l_0_0 do
  local l_0_35 = (sigattr_tail[l_0_34]).attribute
  if l_0_35 == 16389 and (sigattr_tail[l_0_34]).utf8p2 == "ATTR_c09458eb" then
    local l_0_36 = ((sigattr_tail[l_0_34]).utf8p1):lower()
    -- DECOMPILER ERROR at PC141: Overwrote pending register: R29 in 'AssignReg'

    local l_0_37 = (mp.crc32)(0, l_0_36, l_0_23, #l_0_36)
    if l_0_3[l_0_37] ~= nil then
      (table.insert)(l_0_3[l_0_37], l_0_34)
    else
      local l_0_38 = {}
      -- DECOMPILER ERROR at PC155: No list found for R27 , SetList fails

    end
    do
      -- DECOMPILER ERROR at PC162: Overwrote pending register: R28 in 'AssignReg'

      do
        if not (string.find)(l_0_34, "\\[^\\]*$") then
          local l_0_39, l_0_40, l_0_41 = l_0_1[l_0_37] == nil or 0
        end
        -- DECOMPILER ERROR at PC172: Confused about usage of register: R27 in 'UnsetPending'

        local l_0_42 = nil
        if (string.find)(l_0_36, ".", l_0_39, true) ~= nil then
          local l_0_43 = nil
          if (string.sub)(l_0_36, l_0_42 + 1, (string.find)(l_0_36, ".", l_0_39, true) - 1) ~= nil then
            if l_0_4[(string.sub)(l_0_36, l_0_42 + 1, (string.find)(l_0_36, ".", l_0_39, true) - 1)] == nil then
              local l_0_44 = nil
              l_0_4[l_0_44] = {l_0_37, l_0_34}
            else
              do
                do
                  -- DECOMPILER ERROR at PC196: Confused about usage of register: R29 in 'UnsetPending'

                  ;
                  (table.insert)(l_0_4[l_0_44], l_0_34)
                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
end
-- DECOMPILER ERROR at PC200: Overwrote pending register: R17 in 'AssignReg'

local l_0_45 = {}
for l_0_49 = 1, l_0_0 do
  local l_0_50 = (sigattr_tail[l_0_49]).attribute
  if l_0_50 == 16387 then
    local l_0_51 = ((sigattr_tail[l_0_49]).utf8p1):lower()
    local l_0_52 = (mp.crc32)(0, l_0_51, 1, #l_0_51)
    if l_0_1[l_0_52] == nil then
      (table.insert)(l_0_2, l_0_49)
    else
      l_0_3[l_0_52] = nil
    end
    -- DECOMPILER ERROR at PC236: Overwrote pending register: R17 in 'AssignReg'

    if l_0_45[l_0_52] == nil then
      l_0_45[l_0_52] = 1
    end
  end
end
if l_0_17 < 5 then
  return mp.CLEAN
end
for l_0_56,l_0_57 in pairs(l_0_2) do
  local l_0_58 = ((sigattr_tail[l_0_57]).utf8p1):lower()
  do
    local l_0_59, l_0_60, l_0_61, l_0_62 = (string.find)(l_0_58, "\\[^\\]*$") or 0
    -- DECOMPILER ERROR at PC265: Confused about usage of register: R27 in 'UnsetPending'

    local l_0_63 = nil
    if (string.find)(l_0_58, ".", l_0_59, true) ~= nil then
      local l_0_64 = nil
      local l_0_65 = (string.sub)(l_0_58, l_0_63 + 1, -1)
      local l_0_66 = ((string.sub)(l_0_58, l_0_63 + 1, l_0_64 - 1))
      -- DECOMPILER ERROR at PC288: Overwrote pending register: R31 in 'AssignReg'

      -- DECOMPILER ERROR at PC297: Confused about usage of register: R31 in 'UnsetPending'

      if (l_0_65 == nil or l_0_66 ~= nil) and nil ~= nil and (mp.bitand)((mp.GetExtensionClass)(nil), 3) ~= 0 and l_0_4[l_0_66] ~= nil then
        local l_0_67 = nil
        -- DECOMPILER ERROR at PC312: Confused about usage of register: R32 in 'UnsetPending'

        if l_0_3[(l_0_4[l_0_66])[1]] ~= nil then
          local l_0_68 = nil
          if (l_0_1[l_0_68] == nil or not (l_0_1[l_0_68])[1] or #l_0_58 < #((sigattr_tail[(l_0_3[(l_0_4[l_0_66])[1]])[1]]).utf8p1):lower()) and (((sigattr_tail[(l_0_3[(l_0_4[l_0_66])[1]])[1]]).utf8p1):lower()):find(l_0_58, 1, true) == 1 and (((sigattr_tail[(l_0_3[(l_0_4[l_0_66])[1]])[1]]).utf8p1):lower()):byte(#l_0_58 + 1) ~= 58 then
            local l_0_69 = nil
            -- DECOMPILER ERROR at PC357: Unhandled construct in 'MakeBoolean' P1

            if l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_66])[1]])[1]]).utf8p1):lower(), #l_0_58 + 1)] ~= nil and l_0_6[l_0_68] == nil then
              l_0_6[l_0_68] = 1
              ;
              (table.insert)(l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_66])[1]])[1]]).utf8p1):lower(), #l_0_58 + 1)], (l_0_3[l_0_68])[1])
              ;
              (table.insert)(l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_66])[1]])[1]]).utf8p1):lower(), #l_0_58 + 1)], l_0_57)
              if #l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_66])[1]])[1]]).utf8p1):lower(), #l_0_58 + 1)] >= 10 then
                local l_0_70 = nil
                local l_0_71 = false
                for l_0_75,l_0_76 in pairs(l_0_5[l_0_70]) do
                  local l_0_72 = {count = 0}
                  -- DECOMPILER ERROR at PC383: Confused about usage of register: R41 in 'UnsetPending'

                  if (sysio.ReadFile)((sigattr_tail[R41_PC383]).utf8p1, 0, 4) ~= nil and l_0_72[(sysio.ReadFile)((sigattr_tail[R41_PC383]).utf8p1, 0, 4)] == nil then
                    l_0_72[(sysio.ReadFile)((sigattr_tail[R41_PC383]).utf8p1, 0, 4)] = 1
                    l_0_72.count = l_0_72.count + 1
                  end
                  if l_0_7[l_0_77] ~= nil and l_0_15 == false then
                    local l_0_78 = nil
                    -- DECOMPILER ERROR at PC415: Confused about usage of register: R43 in 'UnsetPending'

                    if not ((sigattr_tail[l_0_7[l_0_77]]).utf8p2):find("RemoteIp:;", 1, true) then
                      local l_0_79 = nil
                      if (string.find)((sigattr_tail[l_0_7[l_0_77]]).utf8p2, "RemoteIp", 17, true) ~= nil and #l_0_79 - (string.find)((sigattr_tail[l_0_7[l_0_77]]).utf8p2, "RemoteIp", 17, true) > 20 then
                        local l_0_80 = nil
                        for l_0_84,l_0_85 in (string.gmatch)(l_0_79, "(%w+):([^;]+)") do
                          local l_0_81 = {}
                          -- DECOMPILER ERROR at PC433: Confused about usage of register: R50 in 'UnsetPending'

                          l_0_81[l_0_85] = R50_PC433
                        end
                        -- DECOMPILER ERROR at PC436: Confused about usage of register: R45 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC439: Confused about usage of register: R45 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC442: Confused about usage of register: R45 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC445: Confused about usage of register: R45 in 'UnsetPending'

                        if l_0_81.UsrName ~= nil and l_0_81.Domain ~= nil and l_0_81.RemoteIp ~= nil then
                          l_0_10 = l_0_81.UsrName
                          -- DECOMPILER ERROR at PC446: Confused about usage of register: R45 in 'UnsetPending'

                          l_0_11 = l_0_81.Domain
                          -- DECOMPILER ERROR at PC448: Confused about usage of register: R45 in 'UnsetPending'

                          l_0_12 = scrubData(l_0_81.UsrName)
                          -- DECOMPILER ERROR at PC452: Confused about usage of register: R45 in 'UnsetPending'

                          l_0_13 = scrubData(l_0_81.Domain)
                          -- DECOMPILER ERROR at PC455: Confused about usage of register: R45 in 'UnsetPending'

                          l_0_16 = l_0_81.FSize
                          -- DECOMPILER ERROR at PC458: Confused about usage of register: R45 in 'UnsetPending'

                          local l_0_86 = nil
                          local l_0_87 = (string.match)(l_0_81.RemoteIp, "(.*):(.*)")
                          -- DECOMPILER ERROR at PC474: Overwrote pending register: R47 in 'AssignReg'

                          if (l_0_78 == nil or l_0_87 ~= nil) and (l_0_14 == "" or l_0_14 == l_0_87) then
                            local l_0_88 = "NA"
                            local l_0_89 = table.insert
                            local l_0_90 = l_0_9
                            l_0_89(l_0_90, {path = (sigattr_tail[l_0_77]).utf8p1, magic = l_0_88, fileSize = l_0_16})
                            l_0_14 = l_0_87
                          else
                            do
                              do
                                l_0_15 = true
                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC495: LeaveBlock: unexpected jumping out IF_STMT

                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                -- DECOMPILER ERROR at PC497: Confused about usage of register: R36 in 'UnsetPending'

                if l_0_72.count > 4 then
                  l_0_71 = true
                end
                ;
                (bm.add_related_string)("magic_mismatch", tostring(l_0_71), bm.RelatedStringBMReport)
                ;
                (bm.add_related_string)("ransom_extension", l_0_70, bm.RelatedStringBMReport)
                local l_0_91 = nil
                local l_0_92 = {}
                local l_0_93 = {}
                local l_0_94 = {}
                if isnull((bm.get_imagepath)()) then
                  local l_0_95 = ("NA"):lower()
                  local l_0_96 = (bm.get_current_process_startup_info)()
                  -- DECOMPILER ERROR at PC539: Overwrote pending register: R42 in 'AssignReg'

                  -- DECOMPILER ERROR at PC542: Overwrote pending register: R41 in 'AssignReg'

                  if l_0_96 ~= nil then
                    local l_0_97 = ""
                    for l_0_101,l_0_102 in pairs(l_0_5[l_0_70]) do
                      local l_0_98 = "FileChain_MainSet:"
                      -- DECOMPILER ERROR at PC555: Confused about usage of register: R48 in 'UnsetPending'

                      do
                        local l_0_104, l_0_105, l_0_106 = , (string.find)((sigattr_tail[l_0_89]).utf8p1, "\\[^\\]*$") or 0
                        -- DECOMPILER ERROR at PC567: Confused about usage of register: R49 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC569: Confused about usage of register: R50 in 'UnsetPending'

                        local l_0_107 = nil
                        -- DECOMPILER ERROR at PC577: Confused about usage of register: R50 in 'UnsetPending'

                        do
                          if (string.find)(l_0_104, ".", l_0_105, true) ~= nil then
                            local l_0_108 = nil
                            l_0_98 = l_0_98 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_107, l_0_105 + 1, (string.find)(l_0_104, ".", l_0_105, true) - 1), 0, #(string.sub)(l_0_107, l_0_105 + 1, (string.find)(l_0_104, ".", l_0_105, true) - 1))
                            l_0_98 = l_0_98 .. ";" .. (string.sub)(l_0_107, (string.find)(l_0_104, ".", l_0_105, true) + 1) .. ";"
                          end
                          ;
                          (table.insert)(l_0_93, (sigattr_tail[l_0_103]).utf8p1)
                          local l_0_109 = nil
                          if l_0_7[l_0_103] ~= nil then
                            if sigattr_tail[l_0_7[l_0_103]] ~= nil then
                              local l_0_110 = nil
                              local l_0_111 = nil
                              -- DECOMPILER ERROR at PC634: Overwrote pending register: R52 in 'AssignReg'

                              if l_0_111 == nil then
                                do
                                  (table.insert)(l_0_94, ((sigattr_tail[l_0_7[l_0_103]]).utf8p1):lower())
                                  ;
                                  (table.insert)(l_0_94, l_0_111)
                                  if sigattr_tail[l_0_103] ~= nil then
                                    local l_0_112 = nil
                                    local l_0_113 = l_0_111
                                    -- DECOMPILER ERROR at PC667: Overwrote pending register: R52 in 'AssignReg'

                                    if l_0_113 == nil then
                                      do
                                        (table.insert)(l_0_94, ((sigattr_tail[l_0_103]).utf8p1):lower())
                                        ;
                                        (table.insert)(l_0_94, l_0_113)
                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out DO_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out DO_STMT

                                        -- DECOMPILER ERROR at PC678: LeaveBlock: unexpected jumping out DO_STMT

                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    l_0_92.file_list = l_0_93
                    l_0_92.file_size = l_0_94
                    local l_0_114, l_0_115 = , (bm.get_process_relationships)()
                    for l_0_119,l_0_120 in ipairs(l_0_115) do
                      local l_0_116 = nil
                      -- DECOMPILER ERROR at PC689: Confused about usage of register: R50 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC694: Confused about usage of register: R50 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC694: Overwrote pending register: R52 in 'AssignReg'

                      if l_0_109.image_path ~= nil then
                        (bm.add_related_process)(l_0_113)
                      end
                    end
                    -- DECOMPILER ERROR at PC699: Confused about usage of register: R45 in 'UnsetPending'

                    for l_0_124,l_0_125 in ipairs(l_0_116) do
                      local l_0_121 = nil
                      -- DECOMPILER ERROR at PC702: Confused about usage of register: R50 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC707: Confused about usage of register: R50 in 'UnsetPending'

                      if l_0_109.image_path ~= nil then
                        (bm.add_related_process)(l_0_109.ppid)
                        -- DECOMPILER ERROR at PC710: Confused about usage of register: R50 in 'UnsetPending'

                        TrackPidAndTechniqueBM(l_0_109.ppid, "T1485", "susp_ransomware_childproc_type4")
                      end
                    end
                    ;
                    (bm.add_related_string)("ransom_files_main", l_0_114, bm.RelatedStringBMReport)
                    local l_0_126 = nil
                    ;
                    (bm.add_related_string)("gend_ransom_meta", safeJsonSerialize(l_0_92), bm.RelatedStringBMReport)
                    ;
                    (bm.trigger_sig)("GenericRansomware:Type4", safeJsonSerialize(l_0_92))
                    ;
                    (bm.trigger_sig_delayed)("DelayedRansom:Type4", safeJsonSerialize(l_0_92), 10000)
                    sms_untrusted_process()
                    ;
                    (bm.add_action)("SmsAsyncScanEvent", 100)
                    TrackPidAndTechniqueBM(l_0_96, "T1486", "susp_ransomware_type4")
                    reportTimingData()
                    ;
                    (bm.add_related_string)("sigcount_type4", l_0_19, bm.RelatedStringBMReport)
                    reportSessionInformationInclusive()
                    local l_0_127, l_0_128 = , pcall(reportBmInfo)
                    -- DECOMPILER ERROR at PC781: Overwrote pending register: R52 in 'AssignReg'

                    if not l_0_128 and reportBmInfo then
                      (bm.add_related_string)("bmInfoFailReason", tostring(R52_PC779), R52_PC779)
                    end
                    if l_0_15 == false and #l_0_9 > 0 and l_0_14 ~= nil and l_0_14 ~= "" then
                      local l_0_129 = nil
                      if isnull((mp.GetExtensionClass)(l_0_70)) then
                        local l_0_130, l_0_131 = 1000, nil
                        -- DECOMPILER ERROR at PC803: Overwrote pending register: R52 in 'AssignReg'

                        -- DECOMPILER ERROR at PC804: Overwrote pending register: R52 in 'AssignReg'

                        -- DECOMPILER ERROR at PC807: Overwrote pending register: R52 in 'AssignReg'

                        -- DECOMPILER ERROR at PC813: Overwrote pending register: R51 in 'AssignReg'

                        do
                          if (R52_PC779 and not l_0_131) or nil == nil then
                            local l_0_132 = nil
                            l_0_132, R52_PC779 = R52_PC779, {State = 0, MaxTimeout = 0, Exclusions = "", AggressiveLevel = 0, Plugins = 0}
                          end
                          local l_0_133 = nil
                          l_0_8, R52_PC779 = R52_PC779, {Extension = l_0_70, ExtensionClass = l_0_130, imagePath = l_0_95, commandLine = l_0_97, ppID = l_0_96, UserName = l_0_12, Domain = l_0_13, file_list = l_0_9, Type = "Type4", RemoteEncConfig = l_0_133}
                          R52_PC779 = safeJsonSerialize
                          R52_PC779 = R52_PC779(l_0_8)
                          ;
                          (bm.add_related_string)("RemoteClientData", R52_PC779, bm.RelatedStringBMReport)
                          ;
                          (bm.trigger_sig)("RemoteGenericRansomware:Type4", R52_PC779)
                          local l_0_134, l_0_135 = , pcall(updateSystemDNSServers)
                          if not l_0_135 then
                            (bm.add_related_string)("updateSystemDNSServers_fail", R57_PC864, bm.RelatedStringBMReport)
                          end
                          local l_0_136, l_0_137, l_0_138, l_0_139 = , pcall(updateDomainInfo)
                          if l_0_137 then
                            l_0_8.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_14)
                          else
                            ;
                            (bm.add_related_string)("updateDomainInfo_fail", l_0_138, bm.RelatedStringBMReport)
                          end
                          local l_0_140 = nil
                          local l_0_141 = SafeGetUrlReputation
                          local l_0_142 = {l_0_14}
                          l_0_141 = l_0_141(l_0_142, {SIG_CONTEXT = "BM", CONTEXT_SOURCE = "GenRansom3", TAG = "NOLOOKUP", data = safeJsonSerialize(l_0_8)}, false, 3000, false)
                          if l_0_141 then
                            l_0_142 = l_0_141.error
                            if l_0_142 == 3 then
                              l_0_8.CRReportError = "Failed the first attempt"
                              l_0_142 = SafeGetUrlReputation
                              local l_0_143 = {l_0_14}
                              l_0_142 = l_0_142(l_0_143, {SIG_CONTEXT = "BM", CONTEXT_SOURCE = "GenRansom3", TAG = "NOLOOKUP", data = safeJsonSerialize(l_0_8)}, false, 3000, false)
                              l_0_141 = l_0_142
                            end
                          end
                          do
                            do
                              do
                                l_0_142 = l_0_141.urls
                                l_0_142 = l_0_142[l_0_14]
                                if l_0_142 then
                                  l_0_142 = l_0_141.urls
                                  l_0_142 = l_0_142[l_0_14]
                                  l_0_142 = l_0_142.determination
                                  if l_0_142 ~= 2 then
                                    l_0_142 = l_0_141.urls
                                    l_0_142 = l_0_142[l_0_14]
                                    l_0_142 = l_0_142.determination
                                  end
                                  if l_0_142 == 1 then
                                    l_0_142 = l_0_141.urls
                                    l_0_142 = l_0_142[l_0_14]
                                    l_0_142 = l_0_142.confidence
                                    if l_0_142 then
                                      l_0_142 = l_0_141.urls
                                      l_0_142 = l_0_142[l_0_14]
                                      l_0_142 = l_0_142.confidence
                                      if l_0_142 >= 50 then
                                        l_0_142 = l_0_141.urls
                                        l_0_142 = l_0_142[l_0_14]
                                        l_0_142 = l_0_142.context
                                        l_0_142 = l_0_142.Source
                                        if l_0_142 == "GenRansom" then
                                          l_0_142 = l_0_141.urls
                                          l_0_142 = l_0_142[l_0_14]
                                          l_0_142 = l_0_142.confidence
                                          l_0_8.confidence = l_0_142
                                          l_0_142 = l_0_141.urls
                                          l_0_142 = l_0_142[l_0_14]
                                          l_0_142 = l_0_142.context
                                          l_0_142 = l_0_142.Family
                                          l_0_8.family = l_0_142
                                          l_0_142 = l_0_141.urls
                                          l_0_142 = l_0_142[l_0_14]
                                          l_0_142 = l_0_142.determination
                                          l_0_8.determination = l_0_142
                                          l_0_8.action, l_0_142 = l_0_142, {action = (((l_0_141.urls)[l_0_14]).context).action, parameter = (((l_0_141.urls)[l_0_14]).context).action_parameter, ttl = (((l_0_141.urls)[l_0_14]).context).action_ttl}
                                          l_0_8.ip = l_0_14
                                          l_0_8.context = ((l_0_141.urls)[l_0_14]).context
                                          l_0_8.unscrubbed_username = l_0_10
                                          l_0_8.unscrubbed_domain = l_0_11
                                          ;
                                          (bm.trigger_sig)("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_8))
                                        end
                                      end
                                    end
                                  end
                                end
                                do return mp.INFECTED end
                                do
                                  local l_0_144 = nil
                                  l_0_5[l_0_144] = {(l_0_3[l_0_68])[1], l_0_57}
                                  l_0_6[l_0_68] = 1
                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1007: LeaveBlock: unexpected jumping out DO_STMT

                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN

