-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7fd7443a8d86\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = (mp.GetScannedPPID)()
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
local l_0_3, l_0_4 = (MpCommon.StringRegExpSearch)("(?i)rundll32(?:.exe)?\\s(.*?),", l_0_2)
if not l_0_4 then
  return mp.CLEAN
end
l_0_4 = (string.gsub)(l_0_4, "\'", "")
l_0_4 = (string.lower)(l_0_4)
if (string.find)(l_0_4, "\\windows\\system32\\", 1, true) then
  return mp.CLEAN
end
l_0_0.Dll_Path = l_0_4
if not (string.find)(l_0_4, "\\", 1, true) then
  l_0_4 = "\\" .. l_0_4
end
local l_0_5 = 0
local l_0_6 = (string.gsub)(l_0_4, "\\", "\\\\")
l_0_6 = l_0_6:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
local l_0_7, l_0_8 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_6)
if l_0_7 and l_0_8 then
  do
    if l_0_8.value then
      local l_0_9 = {}
      -- DECOMPILER ERROR at PC89: No list found for R9 , SetList fails

    end
    -- DECOMPILER ERROR at PC92: Overwrote pending register: R10 in 'AssignReg'

    for l_0_13,l_0_14 in ipairs(l_0_8) do
      if (string.find)(l_0_14.value, "UnsignedFile", 1, true) then
        l_0_0.FileDroppedRecently = true
        l_0_0.FileInfo = l_0_8
        local l_0_15 = (string.match)(l_0_14.value, "Process_Img(.*)")
        if l_0_15 then
          local l_0_16 = contains
          local l_0_17 = l_0_15
          local l_0_18 = {}
          -- DECOMPILER ERROR at PC120: No list found for R17 , SetList fails

          -- DECOMPILER ERROR at PC125: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC128: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC129: Overwrote pending register: R19 in 'AssignReg'

          -- DECOMPILER ERROR at PC130: Overwrote pending register: R20 in 'AssignReg'

          -- DECOMPILER ERROR at PC131: Overwrote pending register: R21 in 'AssignReg'

          if l_0_16 then
            do
              l_0_16, l_0_18 = l_0_16(l_0_17, l_0_18), {"program files", "appdata", "dllhost.exe", "svchost.exe", "wget"}
              -- DECOMPILER ERROR at PC137: Overwrote pending register: R5 in 'AssignReg'

              -- DECOMPILER ERROR at PC140: Overwrote pending register: R16 in 'AssignReg'

              if not l_0_16 or (string.find)(l_0_17, "FileAttributes", 1, true) then
                local l_0_19 = (string.match)(l_0_14.value, "%[(.*)%]")
                for l_0_23 in (string.gmatch)(l_0_19, "([^|]+)") do
                  -- DECOMPILER ERROR at PC165: Overwrote pending register: R5 in 'AssignReg'

                  -- DECOMPILER ERROR at PC169: Overwrote pending register: R5 in 'AssignReg'

                end
              end
              do
                -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
    if (not (string.find)(l_0_23, "Aurora.A!rfn") and l_0_23 ~= "SLF:HighRiskHasMotW") or not l_0_0.FileDroppedRecently then
      return mp.CLEAN
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC191: Overwrote pending register: R5 in 'AssignReg'

    if (MpCommon.StringRegExpSearch)("\\\\(desktop|download|onedrive|document|picture)", l_0_4) then
      local l_0_24 = nil
      local l_0_25 = nil
      local l_0_26 = nil
      -- DECOMPILER ERROR at PC201: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC208: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC209: Overwrote pending register: R12 in 'AssignReg'

      if not contains(l_0_4, l_0_24) or (mp.GetParentProcInfo)() then
        if GetRollingQueueKeyValues(l_0_24, l_0_25) then
          l_0_0.ProcessWithPotentialDownload = true
          l_0_0.DownloadCmds = GetRollingQueueKeyValues(l_0_24, l_0_25)
          -- DECOMPILER ERROR at PC215: Overwrote pending register: R5 in 'AssignReg'

        end
        -- DECOMPILER ERROR at PC216: Overwrote pending register: R11 in 'AssignReg'

        l_0_24 = l_0_24()
        l_0_0.Parents = l_0_24
      end
      -- DECOMPILER ERROR at PC221: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC222: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC223: Overwrote pending register: R13 in 'AssignReg'

      if pcall(l_0_24, l_0_25, l_0_26) and l_0_24 then
        l_0_0.FileDroppedByATrackedProcess = true
        -- DECOMPILER ERROR at PC230: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC231: Overwrote pending register: R13 in 'AssignReg'

        l_0_25(l_0_26, (MpCommon.Base64Encode)(safeJsonSerialize(l_0_0)), false)
        -- DECOMPILER ERROR at PC240: Overwrote pending register: R12 in 'AssignReg'

        do
          if l_0_25 then
            local l_0_27 = nil
            -- DECOMPILER ERROR at PC244: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC246: Overwrote pending register: R11 in 'AssignReg'

            l_0_25 = {l_0_26}
          end
          l_0_25 = ipairs
          -- DECOMPILER ERROR at PC248: Overwrote pending register: R13 in 'AssignReg'

          l_0_25 = l_0_25(l_0_26)
          for l_0_31,l_0_32 in l_0_25 do
            local l_0_31, l_0_32 = nil
            l_0_31 = GetAppomalyProcessAttribute
            l_0_32 = l_0_30.value
            l_0_31 = l_0_31(l_0_32)
            local l_0_33, l_0_34 = nil
            if l_0_32 then
              l_0_33 = l_0_30.key
              if l_0_33 == l_0_4 then
                l_0_33 = "FilePathMatch"
              end
              if not l_0_33 then
                l_0_33 = "FileNameMatch"
              end
              l_0_0.Confidence = l_0_33
              l_0_0.Process_Attribute = l_0_32
              l_0_33 = l_0_32.AppName
              if l_0_33 == "OneDrive" then
                l_0_33 = string
                l_0_33 = l_0_33.find
                l_0_34 = l_0_4
                l_0_33 = l_0_33(l_0_34, "shell32.dll")
                if l_0_33 then
                  l_0_33 = mp
                  l_0_33 = l_0_33.CLEAN
                  return l_0_33
                end
              end
              -- DECOMPILER ERROR at PC278: Overwrote pending register: R5 in 'AssignReg'

            end
          end
          do
            l_0_0.Score = l_0_5
            -- DECOMPILER ERROR at PC285: Overwrote pending register: R13 in 'AssignReg'

            if l_0_5 >= 10 then
              local l_0_35, l_0_36 = nil
              -- DECOMPILER ERROR at PC291: Overwrote pending register: R14 in 'AssignReg'

              local l_0_37 = nil
              local l_0_38 = nil
              local l_0_39 = nil
              do
                l_0_38 = safeJsonSerialize(l_0_26, 150, nil, true) or (null)
                l_0_35(l_0_36, l_0_37, l_0_38)
                -- DECOMPILER ERROR at PC298: Confused about usage of register R13 for local variables in 'ReleaseLocals'

                do return mp.CLEAN end
                -- DECOMPILER ERROR at PC301: Confused about usage of register R12 for local variables in 'ReleaseLocals'

              end
            end
          end
        end
      end
    end
  end
end

