-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7fd7443a8d86\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
local l_0_1 = {}
l_0_1.Parents = add_parents_mp()
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
local l_0_4, l_0_5 = (MpCommon.StringRegExpSearch)("(?i)rundll32(?:.exe)?\\s(.*?),", l_0_3)
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = (string.gsub)(l_0_5, "\'", "")
l_0_5 = (string.lower)(l_0_5)
if (string.find)(l_0_5, "\\windows\\system32\\", 1, true) then
  return mp.CLEAN
end
l_0_1.Dll_Path = l_0_5
if not (string.find)(l_0_5, "\\", 1, true) then
  l_0_5 = "\\" .. l_0_5
end
local l_0_6 = 0
local l_0_7 = (string.gsub)(l_0_5, "\\", "\\\\")
l_0_7 = l_0_7:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
local l_0_8, l_0_9 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_7)
if l_0_8 and l_0_9 then
  do
    if l_0_9.value then
      local l_0_10 = {}
      -- DECOMPILER ERROR at PC95: No list found for R10 , SetList fails

    end
    -- DECOMPILER ERROR at PC98: Overwrote pending register: R11 in 'AssignReg'

    for l_0_14,l_0_15 in ipairs(l_0_9) do
      if (string.find)(l_0_15.value, "UnsignedFile", 1, true) then
        l_0_1.FileDroppedRecently = true
        l_0_1.FileInfo = l_0_9
        local l_0_16 = (string.match)(l_0_15.value, "Process_Img(.*)")
        if l_0_16 then
          local l_0_17 = contains
          local l_0_18 = l_0_16
          local l_0_19 = {}
          -- DECOMPILER ERROR at PC126: No list found for R18 , SetList fails

          -- DECOMPILER ERROR at PC131: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC134: Overwrote pending register: R19 in 'AssignReg'

          -- DECOMPILER ERROR at PC135: Overwrote pending register: R20 in 'AssignReg'

          -- DECOMPILER ERROR at PC136: Overwrote pending register: R21 in 'AssignReg'

          -- DECOMPILER ERROR at PC137: Overwrote pending register: R22 in 'AssignReg'

          if l_0_17 then
            do
              l_0_17, l_0_19 = l_0_17(l_0_18, l_0_19), {"program files", "appdata", "dllhost.exe", "svchost.exe", "wget"}
              -- DECOMPILER ERROR at PC143: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC146: Overwrote pending register: R17 in 'AssignReg'

              if not l_0_17 or (string.find)(l_0_18, "FileAttributes", 1, true) then
                local l_0_20 = (string.match)(l_0_15.value, "%[(.*)%]")
                for l_0_24 in (string.gmatch)(l_0_20, "([^|]+)") do
                  -- DECOMPILER ERROR at PC171: Overwrote pending register: R6 in 'AssignReg'

                  -- DECOMPILER ERROR at PC175: Overwrote pending register: R6 in 'AssignReg'

                end
              end
              do
                -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
    if (not (string.find)(l_0_24, "Aurora.A!rfn") and l_0_24 ~= "SLF:HighRiskHasMotW") or not l_0_1.FileDroppedRecently then
      return mp.CLEAN
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC197: Overwrote pending register: R6 in 'AssignReg'

    if (MpCommon.StringRegExpSearch)("\\\\(desktop|download|onedrive|document|picture)", l_0_5) then
      local l_0_25 = nil
      local l_0_26 = nil
      local l_0_27 = nil
      -- DECOMPILER ERROR at PC207: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC210: Overwrote pending register: R12 in 'AssignReg'

      if not contains(l_0_5, l_0_25) or GetRollingQueueKeyValues("PFApp_PotentialDownload_Ppid", l_0_25) then
        l_0_1.ProcessWithPotentialDownload = true
        l_0_1.DownloadCmds = GetRollingQueueKeyValues("PFApp_PotentialDownload_Ppid", l_0_25)
        -- DECOMPILER ERROR at PC216: Overwrote pending register: R6 in 'AssignReg'

      end
      -- DECOMPILER ERROR at PC218: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC219: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC220: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC221: Overwrote pending register: R14 in 'AssignReg'

      if pcall(l_0_25, l_0_26, l_0_27) and l_0_25 then
        l_0_1.FileDroppedByATrackedProcess = true
        -- DECOMPILER ERROR at PC228: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC229: Overwrote pending register: R14 in 'AssignReg'

        l_0_26(l_0_27, (MpCommon.Base64Encode)(safeJsonSerialize(l_0_1)), false)
        -- DECOMPILER ERROR at PC238: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC239: Overwrote pending register: R14 in 'AssignReg'

        l_0_26 = l_0_26(l_0_27)
        for l_0_31,l_0_32 in l_0_26 do
          local l_0_31, l_0_32 = nil
          l_0_31 = GetAppomalyProcessAttribute
          l_0_32 = l_0_30.value
          l_0_31 = l_0_31(l_0_32)
          local l_0_33, l_0_34 = nil
          if l_0_32 then
            l_0_33 = l_0_30.key
            if l_0_33 == l_0_5 then
              l_0_33 = "FilePathMatch"
            end
            if not l_0_33 then
              l_0_33 = "FileNameMatch"
            end
            l_0_1.Confidence = l_0_33
            l_0_1.Process_Attribute = l_0_32
            l_0_33 = l_0_32.AppName
            if l_0_33 == "OneDrive" then
              l_0_33 = string
              l_0_33 = l_0_33.find
              l_0_34 = l_0_5
              l_0_33 = l_0_33(l_0_34, "shell32.dll")
              if l_0_33 then
                l_0_33 = mp
                l_0_33 = l_0_33.CLEAN
                return l_0_33
              end
            end
            -- DECOMPILER ERROR at PC269: Overwrote pending register: R6 in 'AssignReg'

          end
        end
      end
      do
        l_0_1.Score = l_0_6
        -- DECOMPILER ERROR at PC274: Overwrote pending register: R14 in 'AssignReg'

        local l_0_35, l_0_36 = nil
        -- DECOMPILER ERROR at PC280: Overwrote pending register: R15 in 'AssignReg'

        local l_0_37 = nil
        local l_0_38 = nil
        local l_0_39 = nil
        do
          l_0_38 = safeJsonSerialize(l_0_27, 150, nil, true) or (null)
          l_0_35(l_0_36, l_0_37, l_0_38)
          -- DECOMPILER ERROR at PC287: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC288: Overwrote pending register: R15 in 'AssignReg'

          do return l_0_35 end
          -- DECOMPILER ERROR at PC290: Confused about usage of register R14 for local variables in 'ReleaseLocals'

        end
      end
    end
  end
end

