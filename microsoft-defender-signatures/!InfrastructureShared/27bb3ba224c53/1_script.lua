-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\27bb3ba224c53\1_luac 

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
    local l_0_26 = l_0_25:match("%.[^%.]+$")
    if l_0_26 ~= nil then
      if (MpCommon.IsSampled)(1000, true, false, false) == true then
        l_0_26 = l_0_26 .. "\""
        l_0_18.Zyglorinthal = "sampled_1000"
      end
      if (mp.GetExtensionClass)(l_0_26) ~= 4 then
        local l_0_27 = (mp.crc32)(0, l_0_25, 1, #l_0_25)
        if l_0_1[l_0_27] ~= nil then
          (table.insert)(l_0_1[l_0_27], l_0_23)
        else
          local l_0_28 = {}
          -- DECOMPILER ERROR at PC76: No list found for R28 , SetList fails

        end
      end
    end
  end
end
if l_0_17 < 5 then
  return mp.CLEAN
end
for l_0_32 = 1, l_0_0 do
  local l_0_33 = (sigattr_tail[l_0_32]).attribute
  if l_0_33 == 16389 and (sigattr_tail[l_0_32]).utf8p2 == "ATTR_c09458eb" then
    local l_0_34 = ((sigattr_tail[l_0_32]).utf8p1):lower()
    -- DECOMPILER ERROR at PC108: Overwrote pending register: R29 in 'AssignReg'

    local l_0_35 = (mp.crc32)(0, l_0_34, l_0_23, #l_0_34)
    if l_0_3[l_0_35] ~= nil then
      (table.insert)(l_0_3[l_0_35], l_0_32)
    else
      local l_0_36 = {}
      -- DECOMPILER ERROR at PC122: No list found for R27 , SetList fails

    end
    do
      -- DECOMPILER ERROR at PC129: Overwrote pending register: R28 in 'AssignReg'

      do
        if not (string.find)(l_0_32, "\\[^\\]*$") then
          local l_0_37, l_0_38, l_0_39 = l_0_1[l_0_35] == nil or 0
        end
        -- DECOMPILER ERROR at PC139: Confused about usage of register: R27 in 'UnsetPending'

        local l_0_40 = nil
        if (string.find)(l_0_34, ".", l_0_37, true) ~= nil then
          local l_0_41 = nil
          if (string.sub)(l_0_34, l_0_40 + 1, (string.find)(l_0_34, ".", l_0_37, true) - 1) ~= nil then
            if l_0_4[(string.sub)(l_0_34, l_0_40 + 1, (string.find)(l_0_34, ".", l_0_37, true) - 1)] == nil then
              local l_0_42 = nil
              l_0_4[l_0_42] = {l_0_35, l_0_32}
            else
              do
                do
                  -- DECOMPILER ERROR at PC163: Confused about usage of register: R29 in 'UnsetPending'

                  ;
                  (table.insert)(l_0_4[l_0_42], l_0_32)
                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
end
-- DECOMPILER ERROR at PC167: Overwrote pending register: R17 in 'AssignReg'

local l_0_43 = {}
for l_0_47 = 1, l_0_0 do
  local l_0_48 = (sigattr_tail[l_0_47]).attribute
  if l_0_48 == 16387 then
    local l_0_49 = ((sigattr_tail[l_0_47]).utf8p1):lower()
    local l_0_50 = (mp.crc32)(0, l_0_49, 1, #l_0_49)
    if l_0_1[l_0_50] == nil then
      (table.insert)(l_0_2, l_0_47)
    else
      l_0_3[l_0_50] = nil
    end
    -- DECOMPILER ERROR at PC203: Overwrote pending register: R17 in 'AssignReg'

    if l_0_43[l_0_50] == nil then
      l_0_43[l_0_50] = 1
    end
  end
end
if l_0_17 < 5 then
  return mp.CLEAN
end
for l_0_54,l_0_55 in pairs(l_0_2) do
  local l_0_56 = ((sigattr_tail[l_0_55]).utf8p1):lower()
  do
    local l_0_57, l_0_58, l_0_59, l_0_60 = (string.find)(l_0_56, "\\[^\\]*$") or 0
    -- DECOMPILER ERROR at PC232: Confused about usage of register: R27 in 'UnsetPending'

    local l_0_61 = nil
    if (string.find)(l_0_56, ".", l_0_57, true) ~= nil then
      local l_0_62 = nil
      local l_0_63 = (string.sub)(l_0_56, l_0_61 + 1, -1)
      local l_0_64 = ((string.sub)(l_0_56, l_0_61 + 1, l_0_62 - 1))
      -- DECOMPILER ERROR at PC255: Overwrote pending register: R31 in 'AssignReg'

      -- DECOMPILER ERROR at PC264: Confused about usage of register: R31 in 'UnsetPending'

      if (l_0_63 == nil or l_0_64 ~= nil) and nil ~= nil and (mp.bitand)((mp.GetExtensionClass)(nil), 3) ~= 0 and l_0_4[l_0_64] ~= nil then
        local l_0_65 = nil
        -- DECOMPILER ERROR at PC279: Confused about usage of register: R32 in 'UnsetPending'

        if l_0_3[(l_0_4[l_0_64])[1]] ~= nil then
          local l_0_66 = nil
          if (l_0_1[l_0_66] == nil or not (l_0_1[l_0_66])[1] or #l_0_56 < #((sigattr_tail[(l_0_3[(l_0_4[l_0_64])[1]])[1]]).utf8p1):lower()) and (((sigattr_tail[(l_0_3[(l_0_4[l_0_64])[1]])[1]]).utf8p1):lower()):find(l_0_56, 1, true) == 1 and (((sigattr_tail[(l_0_3[(l_0_4[l_0_64])[1]])[1]]).utf8p1):lower()):byte(#l_0_56 + 1) ~= 58 then
            local l_0_67 = nil
            -- DECOMPILER ERROR at PC324: Unhandled construct in 'MakeBoolean' P1

            if l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_64])[1]])[1]]).utf8p1):lower(), #l_0_56 + 1)] ~= nil and l_0_6[l_0_66] == nil then
              l_0_6[l_0_66] = 1
              ;
              (table.insert)(l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_64])[1]])[1]]).utf8p1):lower(), #l_0_56 + 1)], (l_0_3[l_0_66])[1])
              ;
              (table.insert)(l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_64])[1]])[1]]).utf8p1):lower(), #l_0_56 + 1)], l_0_55)
              if #l_0_5[(string.sub)(((sigattr_tail[(l_0_3[(l_0_4[l_0_64])[1]])[1]]).utf8p1):lower(), #l_0_56 + 1)] >= 10 then
                local l_0_68 = nil
                local l_0_69 = false
                for l_0_73,l_0_74 in pairs(l_0_5[l_0_68]) do
                  local l_0_70 = {count = 0}
                  -- DECOMPILER ERROR at PC350: Confused about usage of register: R41 in 'UnsetPending'

                  if (sysio.ReadFile)((sigattr_tail[R41_PC350]).utf8p1, 0, 4) ~= nil and l_0_70[(sysio.ReadFile)((sigattr_tail[R41_PC350]).utf8p1, 0, 4)] == nil then
                    l_0_70[(sysio.ReadFile)((sigattr_tail[R41_PC350]).utf8p1, 0, 4)] = 1
                    l_0_70.count = l_0_70.count + 1
                  end
                  if l_0_7[l_0_75] ~= nil and l_0_15 == false then
                    local l_0_76 = nil
                    -- DECOMPILER ERROR at PC382: Confused about usage of register: R43 in 'UnsetPending'

                    if not ((sigattr_tail[l_0_7[l_0_75]]).utf8p2):find("RemoteIp:;", 1, true) then
                      local l_0_77 = nil
                      if (string.find)((sigattr_tail[l_0_7[l_0_75]]).utf8p2, "RemoteIp", 17, true) ~= nil and #l_0_77 - (string.find)((sigattr_tail[l_0_7[l_0_75]]).utf8p2, "RemoteIp", 17, true) > 20 then
                        local l_0_78 = nil
                        for l_0_82,l_0_83 in (string.gmatch)(l_0_77, "(%w+):([^;]+)") do
                          local l_0_79 = {}
                          -- DECOMPILER ERROR at PC400: Confused about usage of register: R50 in 'UnsetPending'

                          l_0_79[l_0_83] = R50_PC400
                        end
                        -- DECOMPILER ERROR at PC403: Confused about usage of register: R45 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC406: Confused about usage of register: R45 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC409: Confused about usage of register: R45 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC412: Confused about usage of register: R45 in 'UnsetPending'

                        if l_0_79.UsrName ~= nil and l_0_79.Domain ~= nil and l_0_79.RemoteIp ~= nil then
                          l_0_10 = l_0_79.UsrName
                          -- DECOMPILER ERROR at PC413: Confused about usage of register: R45 in 'UnsetPending'

                          l_0_11 = l_0_79.Domain
                          -- DECOMPILER ERROR at PC415: Confused about usage of register: R45 in 'UnsetPending'

                          l_0_12 = scrubData(l_0_79.UsrName)
                          -- DECOMPILER ERROR at PC419: Confused about usage of register: R45 in 'UnsetPending'

                          l_0_13 = scrubData(l_0_79.Domain)
                          -- DECOMPILER ERROR at PC422: Confused about usage of register: R45 in 'UnsetPending'

                          l_0_16 = l_0_79.FSize
                          -- DECOMPILER ERROR at PC425: Confused about usage of register: R45 in 'UnsetPending'

                          local l_0_84 = nil
                          local l_0_85 = (string.match)(l_0_79.RemoteIp, "(.*):(.*)")
                          -- DECOMPILER ERROR at PC441: Overwrote pending register: R47 in 'AssignReg'

                          if (l_0_76 == nil or l_0_85 ~= nil) and (l_0_14 == "" or l_0_14 == l_0_85) then
                            local l_0_86 = "NA"
                            local l_0_87 = table.insert
                            local l_0_88 = l_0_9
                            l_0_87(l_0_88, {path = (sigattr_tail[l_0_75]).utf8p1, magic = l_0_86, fileSize = l_0_16})
                            l_0_14 = l_0_85
                          else
                            do
                              do
                                l_0_15 = true
                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC462: LeaveBlock: unexpected jumping out IF_STMT

                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                -- DECOMPILER ERROR at PC464: Confused about usage of register: R36 in 'UnsetPending'

                if l_0_70.count > 4 then
                  l_0_69 = true
                end
                ;
                (bm.add_related_string)("magic_mismatch", tostring(l_0_69), bm.RelatedStringBMReport)
                ;
                (bm.add_related_string)("ransom_extension", l_0_68, bm.RelatedStringBMReport)
                local l_0_89 = nil
                local l_0_90 = {}
                local l_0_91 = {}
                local l_0_92 = {}
                if isnull((bm.get_imagepath)()) then
                  local l_0_93 = ("NA"):lower()
                  local l_0_94 = (bm.get_current_process_startup_info)()
                  -- DECOMPILER ERROR at PC506: Overwrote pending register: R42 in 'AssignReg'

                  -- DECOMPILER ERROR at PC509: Overwrote pending register: R41 in 'AssignReg'

                  if l_0_94 ~= nil then
                    local l_0_95 = ""
                    for l_0_99,l_0_100 in pairs(l_0_5[l_0_68]) do
                      local l_0_96 = "FileChain_MainSet:"
                      -- DECOMPILER ERROR at PC522: Confused about usage of register: R48 in 'UnsetPending'

                      do
                        local l_0_102, l_0_103, l_0_104 = , (string.find)((sigattr_tail[l_0_87]).utf8p1, "\\[^\\]*$") or 0
                        -- DECOMPILER ERROR at PC534: Confused about usage of register: R49 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC536: Confused about usage of register: R50 in 'UnsetPending'

                        local l_0_105 = nil
                        -- DECOMPILER ERROR at PC544: Confused about usage of register: R50 in 'UnsetPending'

                        do
                          if (string.find)(l_0_102, ".", l_0_103, true) ~= nil then
                            local l_0_106 = nil
                            l_0_96 = l_0_96 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_105, l_0_103 + 1, (string.find)(l_0_102, ".", l_0_103, true) - 1), 0, #(string.sub)(l_0_105, l_0_103 + 1, (string.find)(l_0_102, ".", l_0_103, true) - 1))
                            l_0_96 = l_0_96 .. ";" .. (string.sub)(l_0_105, (string.find)(l_0_102, ".", l_0_103, true) + 1) .. ";"
                          end
                          ;
                          (table.insert)(l_0_91, (sigattr_tail[l_0_101]).utf8p1)
                          local l_0_107 = nil
                          if l_0_7[l_0_101] ~= nil then
                            if sigattr_tail[l_0_7[l_0_101]] ~= nil then
                              local l_0_108 = nil
                              local l_0_109 = nil
                              -- DECOMPILER ERROR at PC601: Overwrote pending register: R52 in 'AssignReg'

                              if l_0_109 == nil then
                                do
                                  (table.insert)(l_0_92, ((sigattr_tail[l_0_7[l_0_101]]).utf8p1):lower())
                                  ;
                                  (table.insert)(l_0_92, l_0_109)
                                  if sigattr_tail[l_0_101] ~= nil then
                                    local l_0_110 = nil
                                    local l_0_111 = l_0_109
                                    -- DECOMPILER ERROR at PC634: Overwrote pending register: R52 in 'AssignReg'

                                    if l_0_111 == nil then
                                      do
                                        (table.insert)(l_0_92, ((sigattr_tail[l_0_101]).utf8p1):lower())
                                        ;
                                        (table.insert)(l_0_92, l_0_111)
                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out DO_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out DO_STMT

                                        -- DECOMPILER ERROR at PC645: LeaveBlock: unexpected jumping out DO_STMT

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
                    l_0_90.file_list = l_0_91
                    l_0_90.file_size = l_0_92
                    local l_0_112, l_0_113 = , (bm.get_process_relationships)()
                    for l_0_117,l_0_118 in ipairs(l_0_113) do
                      local l_0_114 = nil
                      -- DECOMPILER ERROR at PC656: Confused about usage of register: R50 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC661: Confused about usage of register: R50 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC661: Overwrote pending register: R52 in 'AssignReg'

                      if l_0_107.image_path ~= nil then
                        (bm.add_related_process)(l_0_111)
                      end
                    end
                    -- DECOMPILER ERROR at PC666: Confused about usage of register: R45 in 'UnsetPending'

                    for l_0_122,l_0_123 in ipairs(l_0_114) do
                      local l_0_119 = nil
                      -- DECOMPILER ERROR at PC669: Confused about usage of register: R50 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC674: Confused about usage of register: R50 in 'UnsetPending'

                      if l_0_107.image_path ~= nil then
                        (bm.add_related_process)(l_0_107.ppid)
                        -- DECOMPILER ERROR at PC677: Confused about usage of register: R50 in 'UnsetPending'

                        TrackPidAndTechniqueBM(l_0_107.ppid, "T1485", "susp_ransomware_childproc_type4")
                      end
                    end
                    ;
                    (bm.add_related_string)("ransom_files_main", l_0_112, bm.RelatedStringBMReport)
                    local l_0_124 = nil
                    ;
                    (bm.add_related_string)("gend_ransom_meta", safeJsonSerialize(l_0_90), bm.RelatedStringBMReport)
                    ;
                    (bm.trigger_sig)("GenericRansomware:Type4", safeJsonSerialize(l_0_90))
                    ;
                    (bm.trigger_sig_delayed)("DelayedRansom:Type4", safeJsonSerialize(l_0_90), 10000)
                    sms_untrusted_process()
                    ;
                    (bm.add_action)("SmsAsyncScanEvent", 100)
                    TrackPidAndTechniqueBM(l_0_94, "T1486", "susp_ransomware_type4")
                    reportTimingData()
                    ;
                    (bm.add_related_string)("sigcount_type4", l_0_19, bm.RelatedStringBMReport)
                    reportSessionInformationInclusive()
                    local l_0_125, l_0_126 = , pcall(reportBmInfo)
                    -- DECOMPILER ERROR at PC748: Overwrote pending register: R52 in 'AssignReg'

                    if not l_0_126 and reportBmInfo then
                      (bm.add_related_string)("bmInfoFailReason", tostring(R52_PC746), R52_PC746)
                    end
                    if l_0_15 == false and #l_0_9 > 0 and l_0_14 ~= nil and l_0_14 ~= "" then
                      local l_0_127 = nil
                      if isnull((mp.GetExtensionClass)(l_0_68)) then
                        local l_0_128, l_0_129 = 1000, nil
                        -- DECOMPILER ERROR at PC770: Overwrote pending register: R52 in 'AssignReg'

                        -- DECOMPILER ERROR at PC771: Overwrote pending register: R52 in 'AssignReg'

                        -- DECOMPILER ERROR at PC774: Overwrote pending register: R52 in 'AssignReg'

                        -- DECOMPILER ERROR at PC780: Overwrote pending register: R51 in 'AssignReg'

                        do
                          if (R52_PC746 and not l_0_129) or nil == nil then
                            local l_0_130 = nil
                            l_0_130, R52_PC746 = R52_PC746, {State = 0, MaxTimeout = 0, Exclusions = "", AggressiveLevel = 0, Plugins = 0}
                          end
                          local l_0_131 = nil
                          l_0_8, R52_PC746 = R52_PC746, {Extension = l_0_68, ExtensionClass = l_0_128, imagePath = l_0_93, commandLine = l_0_95, ppID = l_0_94, UserName = l_0_12, Domain = l_0_13, file_list = l_0_9, Type = "Type4", RemoteEncConfig = l_0_131}
                          R52_PC746 = safeJsonSerialize
                          R52_PC746 = R52_PC746(l_0_8)
                          ;
                          (bm.add_related_string)("RemoteClientData", R52_PC746, bm.RelatedStringBMReport)
                          ;
                          (bm.trigger_sig)("RemoteGenericRansomware:Type4", R52_PC746)
                          local l_0_132, l_0_133 = , pcall(updateSystemDNSServers)
                          if not l_0_133 then
                            (bm.add_related_string)("updateSystemDNSServers_fail", R57_PC831, bm.RelatedStringBMReport)
                          end
                          local l_0_134, l_0_135, l_0_136, l_0_137 = , pcall(updateDomainInfo)
                          if l_0_135 then
                            l_0_8.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_14)
                          else
                            ;
                            (bm.add_related_string)("updateDomainInfo_fail", l_0_136, bm.RelatedStringBMReport)
                          end
                          local l_0_138 = nil
                          local l_0_139 = SafeGetUrlReputation
                          local l_0_140 = {l_0_14}
                          l_0_139 = l_0_139(l_0_140, {SIG_CONTEXT = "BM", CONTEXT_SOURCE = "GenRansom3", TAG = "NOLOOKUP", data = safeJsonSerialize(l_0_8)}, false, 3000, false)
                          if l_0_139 then
                            l_0_140 = l_0_139.error
                            if l_0_140 == 3 then
                              l_0_8.CRReportError = "Failed the first attempt"
                              l_0_140 = SafeGetUrlReputation
                              local l_0_141 = {l_0_14}
                              l_0_140 = l_0_140(l_0_141, {SIG_CONTEXT = "BM", CONTEXT_SOURCE = "GenRansom3", TAG = "NOLOOKUP", data = safeJsonSerialize(l_0_8)}, false, 3000, false)
                              l_0_139 = l_0_140
                            end
                          end
                          do
                            do
                              do
                                l_0_140 = l_0_139.urls
                                l_0_140 = l_0_140[l_0_14]
                                if l_0_140 then
                                  l_0_140 = l_0_139.urls
                                  l_0_140 = l_0_140[l_0_14]
                                  l_0_140 = l_0_140.determination
                                  if l_0_140 ~= 2 then
                                    l_0_140 = l_0_139.urls
                                    l_0_140 = l_0_140[l_0_14]
                                    l_0_140 = l_0_140.determination
                                  end
                                  if l_0_140 == 1 then
                                    l_0_140 = l_0_139.urls
                                    l_0_140 = l_0_140[l_0_14]
                                    l_0_140 = l_0_140.confidence
                                    if l_0_140 then
                                      l_0_140 = l_0_139.urls
                                      l_0_140 = l_0_140[l_0_14]
                                      l_0_140 = l_0_140.confidence
                                      if l_0_140 >= 50 then
                                        l_0_140 = l_0_139.urls
                                        l_0_140 = l_0_140[l_0_14]
                                        l_0_140 = l_0_140.context
                                        l_0_140 = l_0_140.Source
                                        if l_0_140 == "GenRansom" then
                                          l_0_140 = l_0_139.urls
                                          l_0_140 = l_0_140[l_0_14]
                                          l_0_140 = l_0_140.confidence
                                          l_0_8.confidence = l_0_140
                                          l_0_140 = l_0_139.urls
                                          l_0_140 = l_0_140[l_0_14]
                                          l_0_140 = l_0_140.context
                                          l_0_140 = l_0_140.Family
                                          l_0_8.family = l_0_140
                                          l_0_140 = l_0_139.urls
                                          l_0_140 = l_0_140[l_0_14]
                                          l_0_140 = l_0_140.determination
                                          l_0_8.determination = l_0_140
                                          l_0_8.action, l_0_140 = l_0_140, {action = (((l_0_139.urls)[l_0_14]).context).action, parameter = (((l_0_139.urls)[l_0_14]).context).action_parameter, ttl = (((l_0_139.urls)[l_0_14]).context).action_ttl}
                                          l_0_8.ip = l_0_14
                                          l_0_8.context = ((l_0_139.urls)[l_0_14]).context
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
                                  local l_0_142 = nil
                                  l_0_5[l_0_142] = {(l_0_3[l_0_66])[1], l_0_55}
                                  l_0_6[l_0_66] = 1
                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC974: LeaveBlock: unexpected jumping out DO_STMT

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

