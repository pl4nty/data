-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32PFAppsSusShellDropA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
local l_0_1 = (mp.ContextualExpandEnvironmentVariables)(l_0_0)
if l_0_1 and (mp.IsKnownFriendlyFile)(l_0_1, true, false) then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if not l_0_3 or not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = (MpCommon.PathToWin32Path)(l_0_4)
local l_0_6 = l_0_5 .. "\\" .. l_0_3
do
  local l_0_7, l_0_8 = (mp.GetProcessCommandLine)(l_0_2) or ""
  local l_0_9 = nil
  if contains(l_0_6 .. l_0_9, {"sunbelt.*sbscan.exe", "AppData\\Local\\Microsoft\\OneDrive\\OneDrive.exe\" /background"}, false) then
    return mp.CLEAN
  end
  local l_0_10, l_0_11 = , GetAppomalyProcessAttribute(l_0_2)
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_12 = nil
  if not (MpCommon.PathToWin32Path)(l_0_1) then
    return mp.CLEAN
  end
  local l_0_13 = nil
  if ((MpCommon.PathToWin32Path)(l_0_1)):match("([^\\]+)$") then
    local l_0_14 = nil
    local l_0_15 = contains
    local l_0_16 = l_0_14
    l_0_15 = l_0_15(l_0_16, {".exe", ".dll", ".ps1", ".bat"})
    if l_0_15 then
      l_0_15 = AppendToRollingQueue
      l_0_16 = "PFApp_FileDropped_Path"
      l_0_15(l_0_16, (string.lower)(l_0_13), l_0_2, 1800, 500, 1)
    end
  end
  do
    local l_0_17 = nil
    if not safeJsonDeserialize(l_0_12) then
      return mp.CLEAN
    end
    local l_0_18 = nil
    local l_0_19 = {}
    local l_0_20 = 0
    do
      if (mp.enum_mpattributesubstring)("") and #(mp.enum_mpattributesubstring)("") > 0 then
        local l_0_21 = nil
        for l_0_25,l_0_26 in ipairs(l_0_21) do
          local l_0_22 = {}
          -- DECOMPILER ERROR at PC152: Confused about usage of register: R22 in 'UnsetPending'

          local l_0_28 = (MpCommon.StringRegExpSearch)("((alf:|slf:|tel:|detection:).*(webshell|shellcode|shellexecute|downloader|exploit|backdoor))", (string.lower)(R22_PC152))
          if l_0_28 and #l_0_22 < 15 then
            (table.insert)(l_0_22, l_0_27)
          end
        end
        -- DECOMPILER ERROR at PC167: Confused about usage of register: R17 in 'UnsetPending'

        -- DECOMPILER ERROR at PC171: Confused about usage of register: R17 in 'UnsetPending'

        if #l_0_22 > 0 then
          l_0_20 = l_0_20 + #table_dedup(l_0_22) * 10
          -- DECOMPILER ERROR at PC180: Confused about usage of register: R17 in 'UnsetPending'

          l_0_19.FileAttributes = "[" .. (table.concat)(table_dedup(l_0_22), "|") .. "]"
        end
      end
      local l_0_29 = nil
      l_0_19.DirectoryGenScore = GetDirectoryRiskScore(l_0_13)
      local l_0_30 = nil
      local l_0_31, l_0_32 = NormalizeFileName(l_0_17), l_0_17:match("^(.+)%.([^%.]+)$")
      l_0_19.FileExtensionScore = GetFileExtensionScore(R22_PC198)
      l_0_20 = l_0_20 + (l_0_19.FileExtensionScore or 0)
      local l_0_33 = nil
      -- DECOMPILER ERROR at PC210: Overwrote pending register: R22 in 'AssignReg'

      R22_PC198 = R22_PC198((string.match)(R22_PC198, "^(.*)\\"))
      local l_0_34 = nil
      l_0_19.NormalizedDirectory = R22_PC198
      l_0_19.Directory = l_0_34
      l_0_19.AnomalousDirectory = false
      local l_0_35 = nil
      if not l_0_18.AppName then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC223: Confused about usage of register: R23 in 'UnsetPending'

      local l_0_36 = nil
      if IsPotentiallyClean("CleanFileDrop", l_0_36, l_0_17) then
        return mp.CLEAN
      end
      if l_0_35 then
        local l_0_37 = "MarkerRecord_" .. l_0_18.AppName
        local l_0_38, l_0_39 = , AnomalyTableCheck("Appomaly_File_Directory", l_0_36 .. ";" .. l_0_35, 30, l_0_37)
        if l_0_39 and not "Appomaly_File_Directory" then
          l_0_19.AnomalousDirectory = true
          l_0_30 = l_0_30 + 5
        end
        l_0_19.AnomalousDirectory_tblInfo = l_0_36 .. ";" .. l_0_35
      end
      do
        l_0_19.AnomalousFileExtension = false
        l_0_19.AnomalousFileName = false
        if l_0_17 then
          l_0_19.FileName_Normalized = l_0_31
          l_0_19.FileName = l_0_17
          l_0_19.FileName_Randomness_Score = GetFileNameRandomnessScore(l_0_17)
          local l_0_40, l_0_41, l_0_42, l_0_43, l_0_44 = , pcall(computeStringScores, l_0_17)
          local l_0_45 = nil
          -- DECOMPILER ERROR at PC284: Unhandled construct in 'MakeBoolean' P3

          if (l_0_43 > 0 and l_0_42 > 1) or l_0_44 > 5 then
            l_0_19.FileName_String_Score = {ConsonantVowelsRepetition = l_0_42, ConsonantVowelsRepetitionRatio = l_0_43, CaseSwitches = l_0_44, LetterNumberAlternations = l_0_45, FileName_String_Score_Malicious = true}
            if l_0_31 then
              local l_0_46 = nil
              local l_0_47, l_0_48 = , AnomalyTableCheck("Appomaly_File_Name", l_0_36 .. ";" .. l_0_31, 30, l_0_40)
              if l_0_48 and not "Appomaly_File_Name" then
                l_0_19.AnomalousFileName = true
                l_0_20 = l_0_20 + 10
              end
              l_0_19.AnomalousFileName_tblInfo = l_0_36 .. ";" .. l_0_31
            end
            do
              local l_0_49, l_0_50 = , l_0_17:match("^(.+)%.([^%.]+)$")
              if l_0_17 then
                local l_0_51 = nil
                local l_0_52, l_0_53 = , AnomalyTableCheck(R35_PC312, l_0_36 .. ";" .. R35_PC312, 30, l_0_40)
                if l_0_53 and not R35_PC312 then
                  l_0_19.AnomalousFileExtension = true
                  l_0_20 = l_0_20 + 10
                end
                l_0_19.AnomalousFileExtension_tblInfo = l_0_36 .. ";" .. R35_PC312
              end
              do
                l_0_19.FileDropScore = l_0_20
                local l_0_54 = nil
                local l_0_55, l_0_56 = l_0_18.Score, nil
                -- DECOMPILER ERROR at PC341: Overwrote pending register: R27 in 'AssignReg'

                if l_0_20 >= 10 then
                  IncreaseProcessAnomalyScore(l_0_2, nil, l_0_56, l_0_11, l_0_19)
                else
                  -- DECOMPILER ERROR at PC363: Overwrote pending register: R26 in 'AssignReg'

                  if l_0_55 > 0 and l_0_20 > 5 then
                    IncreaseProcessAnomalyScore(l_0_2, l_0_20, l_0_56, l_0_11, l_0_19)
                  end
                end
                if l_0_19.AnomalousDirectory then
                  local l_0_57 = nil
                  local l_0_58 = l_0_36
                  local l_0_59 = l_0_35
                  local l_0_60 = 1
                  -- DECOMPILER ERROR at PC382: Overwrote pending register: R35 in 'AssignReg'

                  if hasSeenBefore(l_0_58, l_0_59, R35_PC312, "FileDropInSuspDirectory") then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC392: Overwrote pending register: R35 in 'AssignReg'

                  -- DECOMPILER ERROR at PC395: Overwrote pending register: R35 in 'AssignReg'

                  -- DECOMPILER ERROR at PC397: Overwrote pending register: R26 in 'AssignReg'

                  l_0_57 = 5
                  -- DECOMPILER ERROR at PC402: Overwrote pending register: R35 in 'AssignReg'

                  IncreaseProcessAnomalyScore(l_0_2, l_0_57, R35_PC312, l_0_11, l_0_19)
                end
                do
                  if l_0_56 then
                    l_0_19.ProcessAttribute = l_0_18
                    l_0_19.FilePath = l_0_0
                    l_0_19.Parents = add_parents_mp()
                    local l_0_61, l_0_62 = , safeJsonSerialize(l_0_19, 150, nil, true)
                    if l_0_62 then
                      (MpCommon.BmTriggerSig)(l_0_2, "LUA:PFAppsSusShellDrop", l_0_62)
                      return mp.INFECTED
                    else
                      set_research_data("Error", R32_PC435, false)
                      return mp.INFECTED
                    end
                  end
                  do
                    return mp.CLEAN
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

