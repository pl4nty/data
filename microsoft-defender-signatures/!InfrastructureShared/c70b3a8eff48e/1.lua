-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c70b3a8eff48e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = 5
for l_0_7 = 1, l_0_0 do
  local l_0_8 = (sigattr_tail[l_0_7]).utf8p2
  if (sigattr_tail[l_0_7]).attribute == 16385 and (sigattr_tail[l_0_7]).utf8p1 and ((sigattr_tail[l_0_7]).utf8p1):byte(1) ~= 37 and l_0_8:find("TotalSizeAppend:0", 1, true) == nil then
    local l_0_9 = ((sigattr_tail[l_0_7]).utf8p1):lower()
    local l_0_10 = l_0_9:match("[^\\]+$")
    if l_0_10 ~= nil then
      local l_0_11 = l_0_10:match("%.[^%.]+$")
      if l_0_11 ~= nil and l_0_2[l_0_9] == nil then
        l_0_2[l_0_9] = l_0_7
        local l_0_12 = {}
        for l_0_16,l_0_17 in (string.gmatch)(l_0_8, "(%w+):(%w+)") do
          l_0_12[l_0_16] = l_0_17
        end
        local l_0_18 = tonumber(l_0_12.NumWrites)
        local l_0_19 = tonumber(l_0_12.TotalSizeWrite)
        local l_0_20 = tonumber(l_0_12.TotalSizeAppend)
        if l_0_18 ~= nil and l_0_19 ~= nil and l_0_20 ~= nil and l_0_18 > 0 and l_0_19 > 0 and l_0_20 < l_0_19 and l_0_20 > 5 and l_0_20 < 2000 then
          if l_0_1[l_0_20] ~= nil then
            (table.insert)(l_0_1[l_0_20], l_0_7)
          else
            local l_0_21 = {}
            -- DECOMPILER ERROR at PC102: No list found for R16 , SetList fails

          end
        end
      end
    end
  end
end
local l_0_22 = ""
local l_0_23 = false
local l_0_24 = {}
local l_0_25 = {}
local l_0_26 = ""
local l_0_27 = ""
local l_0_28 = ""
local l_0_29 = ""
local l_0_30 = 0
do
  local l_0_31 = 0
  for l_0_35,l_0_36 in pairs(l_0_1) do
    local l_0_37 = #l_0_36
    if l_0_3 <= l_0_37 then
      local l_0_38 = {}
      local l_0_39 = {}
      for l_0_43 = 1, l_0_37 do
        local l_0_44 = (l_0_1[l_0_35])[l_0_43]
        local l_0_45 = (sigattr_tail[l_0_44]).utf8p2
        local l_0_46 = {}
        local l_0_47 = {}
        for l_0_51,l_0_52 in (string.gmatch)(l_0_45, "(%w+):(%w+)") do
        end
        for l_0_56 = 1, l_0_0 do
          if (sigattr_tail[l_0_56]).attribute == 16386 and ((sigattr_tail[l_0_56]).utf8p1):byte(1) ~= 37 and (sigattr_tail[l_0_56]).utf8p2 == (sigattr_tail[l_0_44]).utf8p1 then
            local l_0_57 = ((sigattr_tail[l_0_56]).utf8p1):lower()
            local l_0_58 = ((sigattr_tail[l_0_56]).utf8p2):lower()
            local l_0_59 = (l_0_57:match("(.*[/\\])")):lower()
            local l_0_60 = (l_0_58:match("(.*[/\\])")):lower()
            if l_0_59 == l_0_60 and l_0_57:find(l_0_58, 1, true) == 1 and l_0_57:byte(#l_0_58 + 1) ~= 58 then
              local l_0_61 = l_0_57:match("%.[^%.]+$")
              if l_0_61 and (mp.GetExtensionClass)(l_0_61) ~= 4 then
                local l_0_62 = (string.sub)(l_0_57, #l_0_58 + 1)
                if l_0_24[l_0_62] ~= nil then
                  (table.insert)(l_0_24[l_0_62], l_0_56)
                else
                  local l_0_63 = {}
                  -- DECOMPILER ERROR at PC254: No list found for R40 , SetList fails

                end
              end
            end
          end
        end
        if l_0_30 < 5 then
          (table.insert)(l_0_38, l_0_47)
        end
        local l_0_64 = (sigattr_tail[l_0_44]).utf8p2
        if #l_0_64 > 136 then
          local l_0_65 = (string.find)(l_0_64, "RemoteIp", 100, true)
          if l_0_65 ~= nil and #l_0_64 - l_0_65 > 20 then
            local l_0_66 = {}
            for l_0_70,l_0_71 in (string.gmatch)(l_0_64, "(%w+):([^;]+)") do
            end
            if l_0_66.UsrName ~= nil and l_0_66.Domain ~= nil and l_0_66.RemoteIp ~= nil then
              local l_0_72 = (string.match)(l_0_66.RemoteIp, "(.*):(.*)")
              do
                if l_0_66.FSize == nil then
                  local l_0_73, l_0_74 = (sysio.GetFileSize)((sigattr_tail[l_0_44]).utf8p1)
                end
                local l_0_75 = nil
                local l_0_76 = "NA"
                do
                  if l_0_75 ~= nil and l_0_75 > 256 then
                    local l_0_77 = -1
                    -- DECOMPILER ERROR at PC349: Overwrote pending register: R41 in 'AssignReg'

                  end
                  if ((sysio.ReadFile)((sigattr_tail[l_0_44]).utf8p1, 0, 256) == nil or l_0_72 ~= nil) and (l_0_22 == "" or l_0_22 == l_0_72) then
                    if l_0_31 < 5 then
                      local l_0_78 = l_0_77
                      local l_0_79 = table.insert
                      local l_0_80 = l_0_25
                      l_0_79(l_0_80, {path = (sigattr_tail[l_0_44]).utf8p1, magic = l_0_76, fileSize = l_0_75, entropy = l_0_78})
                    end
                  else
                  end
                  do
                    -- DECOMPILER ERROR at PC384: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC384: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC384: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC384: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC384: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC384: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC384: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC384: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
      local l_0_81 = ""
      for l_0_85,l_0_86 in pairs(l_0_24) do
        local l_0_87 = false
        local l_0_88 = {}
        local l_0_89 = "FileChain_MainSet:"
        if #l_0_24[l_0_81] > 4 then
          for l_0_93,l_0_94 in pairs(l_0_86) do
            local l_0_95 = (sysio.ReadFile)((sigattr_tail[l_0_94]).utf8p1, 0, 4)
            if l_0_95 ~= nil and l_0_88[l_0_95] == nil then
              local l_0_96 = (sigattr_tail[l_0_94]).utf8p1
              do
                local l_0_97, l_0_98, l_0_99 = (string.find)(l_0_96, "\\[^\\]*$") or 0
                -- DECOMPILER ERROR at PC435: Confused about usage of register: R38 in 'UnsetPending'

                local l_0_100 = nil
                do
                  if (string.find)(l_0_96, ".", l_0_97, true) ~= nil then
                    local l_0_101 = nil
                    -- DECOMPILER ERROR at PC463: Overwrote pending register: R30 in 'AssignReg'

                  end
                  -- DECOMPILER ERROR at PC489: Confused about usage of register: R39 in 'UnsetPending'

                  do
                    if (string.find)(l_0_96, ".", l_0_100, true) ~= nil then
                      local l_0_102 = nil
                      -- DECOMPILER ERROR at PC499: Overwrote pending register: R30 in 'AssignReg'

                      -- DECOMPILER ERROR at PC508: Overwrote pending register: R30 in 'AssignReg'

                    end
                    -- DECOMPILER ERROR at PC509: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC509: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC509: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC509: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
          if l_0_88.count > 4 then
            do
              do
                (bm.add_related_string)("magic_mismatch", tostring(l_0_87), bm.RelatedStringBMReport)
                ;
                (bm.add_related_string)("ransom_files_main", l_0_89, bm.RelatedStringBMReport)
                ;
                (bm.add_related_string)("ransom_extension", l_0_81, bm.RelatedStringBMReport)
                do break end
                -- DECOMPILER ERROR at PC539: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC539: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC539: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC539: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC539: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
      local l_0_103 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
      local l_0_104 = false
      local l_0_105 = -1
      local l_0_106 = -1
      local l_0_107 = -1
      -- DECOMPILER ERROR at PC554: Overwrote pending register: R28 in 'AssignReg'

      local l_0_108 = l_0_87
      -- DECOMPILER ERROR at PC556: Overwrote pending register: R30 in 'AssignReg'

      if not isnull(l_0_89) then
        if l_0_108 ~= nil then
          for l_0_112,l_0_113 in ipairs(l_0_108) do
            -- DECOMPILER ERROR at PC581: Overwrote pending register: R37 in 'AssignReg'

            local l_0_114 = tonumber((string.match)(l_0_113, l_0_96))
            -- DECOMPILER ERROR at PC593: Overwrote pending register: R38 in 'AssignReg'

            if l_0_114 ~= nil and l_0_105 < l_0_114 then
              do
                local l_0_115 = tonumber((string.match)(l_0_113, l_0_100))
                -- DECOMPILER ERROR at PC601: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC601: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
        -- DECOMPILER ERROR at PC621: Overwrote pending register: R26 in 'AssignReg'

        -- DECOMPILER ERROR at PC623: Overwrote pending register: R26 in 'AssignReg'

      else
      end
      if (l_0_115 == nil or l_0_107 >= l_0_115 or ((sysio.GetLastResult)()).Success) and l_0_106 ~= 0 then
        local l_0_116 = ""
        local l_0_117 = ""
        local l_0_118 = (bm.get_current_process_startup_info)()
        if l_0_118 ~= nil then
          local l_0_119 = {}
          local l_0_120 = safeJsonSerialize(l_0_39)
          ;
          (bm.add_related_string)("genfa_ransom_meta", l_0_120, bm.RelatedStringBMReport)
          ;
          (bm.trigger_sig)("GenericRansomware:FileAppend", l_0_120)
          reportTimingData()
          sms_untrusted_process()
          if l_0_23 == false and #l_0_25 > 0 and l_0_22 ~= nil and l_0_22 ~= "" then
            local l_0_121 = 1000
            if not isnull(l_0_81) then
              local l_0_122, l_0_123 = nil, nil
              do
                if (MpCommon.GetBehavioralNetworkBlocksSettings and not l_0_122) or l_0_123 == nil then
                  local l_0_124 = {}
                  -- DECOMPILER ERROR at PC711: Overwrote pending register: R36 in 'AssignReg'

                end
                local l_0_125 = {}
                local l_0_126 = safeJsonSerialize(l_0_125)
                ;
                (bm.add_related_string)("RemoteClientData", l_0_126, bm.RelatedStringBMReport)
                local l_0_127, l_0_128 = pcall(updateSystemDNSServers)
                if not l_0_127 then
                  (bm.add_related_string)("updateSystemDNSServers_fail", l_0_128, bm.RelatedStringBMReport)
                end
                local l_0_129, l_0_130, l_0_131, l_0_132 = pcall(updateDomainInfo)
                if l_0_129 then
                  (bm.add_related_string)("updateDomainInfo_fail", l_0_130, bm.RelatedStringBMReport)
                  local l_0_133 = SafeGetUrlReputation
                  local l_0_134 = {}
                  -- DECOMPILER ERROR at PC767: No list found for R46 , SetList fails

                  local l_0_135 = {}
                  -- DECOMPILER ERROR at PC786: Overwrote pending register: R46 in 'AssignReg'

                  do
                    do
                      do
                        if l_0_133 and l_0_134 == 3 then
                          local l_0_136 = {}
                          -- DECOMPILER ERROR at PC802: Overwrote pending register: R45 in 'AssignReg'

                        end
                        -- DECOMPILER ERROR at PC803: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC804: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC807: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC808: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC809: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC812: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC813: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC814: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC817: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC818: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC819: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC822: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC823: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC824: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC827: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC828: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC829: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC830: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC833: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC834: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC835: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC837: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC838: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC839: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC840: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC842: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC843: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC844: Overwrote pending register: R46 in 'AssignReg'

                        -- DECOMPILER ERROR at PC847: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC848: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC849: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC850: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC852: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC853: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC854: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC855: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC857: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC858: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC859: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC860: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC864: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC865: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC866: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC870: Overwrote pending register: R47 in 'AssignReg'

                        -- DECOMPILER ERROR at PC871: Overwrote pending register: R47 in 'AssignReg'

                        if l_0_134 and (l_0_134 == 2 or l_0_134 == 1) and l_0_134 and l_0_134 >= 50 and l_0_134 == "GenRansom" then
                          l_0_135("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_125))
                        end
                        -- DECOMPILER ERROR at PC877: Overwrote pending register: R34 in 'AssignReg'

                        do return l_0_121.INFECTED end
                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC880: LeaveBlock: unexpected jumping out IF_STMT

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
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

