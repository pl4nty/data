local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if 5 < L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L1_1 = "|explorer.exe|"
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = L0_1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "<Exec>.*<Command>(.*)</Command>.*</Exec>"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "<Exec>.*<WorkingDirectory>(.*)</WorkingDirectory>.*</Exec>"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= nil then
  L5_1 = L3_1
  L4_1 = L3_1.sub
  L6_1 = -1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= "\\" then
    L4_1 = L3_1
    L5_1 = "\\"
    L3_1 = L4_1 .. L5_1
  end
end
L4_1 = L2_1
L5_1 = string
L5_1 = L5_1.match
L6_1 = L1_1
L7_1 = "<Exec>.*<Arguments>(.*)</Arguments>.*</Exec>"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= nil then
  L6_1 = L4_1
  L7_1 = " "
  L8_1 = L5_1
  L4_1 = L6_1 .. L7_1 .. L8_1
end
L6_1 = isCommonScheduledTaskCommand
L7_1 = L4_1
L6_1 = L6_1(L7_1)
if L6_1 == true then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.vfo_add_buffer
L7_1 = L4_1
L8_1 = "[TaskCommand]"
L9_1 = 0
L6_1(L7_1, L8_1, L9_1)
L6_1 = {}
L7_1 = table
L7_1 = L7_1.insert
L8_1 = L6_1
L9_1 = L4_1
L7_1(L8_1, L9_1)
L7_1 = MpCommon
L7_1 = L7_1.SetPersistContextNoPath
L8_1 = "Lua:SchedTaskCommand"
L9_1 = L6_1
L10_1 = 100
L7_1(L8_1, L9_1, L10_1)
L7_1 = TrackCommandLineAndTechnique
L8_1 = L4_1
L9_1 = "T1053.005:schtask_target"
L7_1(L8_1, L9_1)
L7_1 = TrackCommandLineAndTechnique
L8_1 = L4_1
L9_1 = "LuaTriggerTaskResourceScanB"
L7_1(L8_1, L9_1)
if L3_1 ~= nil then
  L7_1 = TrackCommandLineAndTechnique
  L8_1 = L3_1
  L9_1 = L4_1
  L8_1 = L8_1 .. L9_1
  L9_1 = "T1053.005:schtask_target"
  L7_1(L8_1, L9_1)
else
  L7_1 = TrackCommandLineAndTechnique
  L8_1 = "c:\\windows\\system32\\"
  L9_1 = L4_1
  L8_1 = L8_1 .. L9_1
  L9_1 = "T1053.005:schtask_target"
  L7_1(L8_1, L9_1)
  L7_1 = TrackCommandLineAndTechnique
  L8_1 = "c:\\windows\\"
  L9_1 = L4_1
  L8_1 = L8_1 .. L9_1
  L9_1 = "T1053.005:schtask_target"
  L7_1(L8_1, L9_1)
end
L7_1 = getCommandLineType
L8_1 = L4_1
L7_1, L8_1 = L7_1(L8_1)
L9_1 = get_filepaths_from_string
L10_1 = L4_1
L11_1 = L3_1
L9_1 = L9_1(L10_1, L11_1)
L10_1 = ipairs
L11_1 = L9_1
L10_1, L11_1, L12_1 = L10_1(L11_1)
for L13_1, L14_1 in L10_1, L11_1, L12_1 do
  L15_1 = normalize_path
  L16_1 = L14_1
  L15_1 = L15_1(L16_1)
  L16_1 = string
  L16_1 = L16_1.find
  L17_1 = L15_1
  L18_1 = "windows\\ccmcache\\"
  L19_1 = 1
  L20_1 = true
  L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
  if not L16_1 then
    L16_1 = string
    L16_1 = L16_1.find
    L17_1 = L15_1
    L18_1 = "\\sysvol\\"
    L19_1 = 1
    L20_1 = true
    L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
    if not L16_1 then
      L16_1 = string
      L16_1 = L16_1.find
      L17_1 = L15_1
      L18_1 = "\\netlogon\\"
      L19_1 = 1
      L20_1 = true
      L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
      if not L16_1 then
        L16_1 = string
        L16_1 = L16_1.find
        L17_1 = L15_1
        L18_1 = "\\support10$\\"
        L19_1 = 1
        L20_1 = true
        L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
        if not L16_1 then
          L16_1 = string
          L16_1 = L16_1.find
          L17_1 = L15_1
          L18_1 = "\\program files"
          L19_1 = 1
          L20_1 = true
          L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
          if not L16_1 then
            L16_1 = string
            L16_1 = L16_1.find
            L17_1 = L15_1
            L18_1 = "\\windows\\"
            L19_1 = 1
            L20_1 = true
            L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
            if not L16_1 then
              goto lbl_191
            end
          end
        end
      end
    end
  end
  L16_1 = mp
  L16_1 = L16_1.CLEAN
  do return L16_1 end
  ::lbl_191::
  L16_1 = StringStartsWith
  L17_1 = L15_1
  L18_1 = "\\\\"
  L16_1 = L16_1(L17_1, L18_1)
  if L16_1 then
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    return L16_1
  end
  L16_1 = isCommonScheduledTaskFile
  L17_1 = L15_1
  L16_1 = L16_1(L17_1)
  if L16_1 == true then
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    return L16_1
  end
  L16_1 = sysio
  L16_1 = L16_1.IsFileExists
  L17_1 = L14_1
  L16_1 = L16_1(L17_1)
  if L16_1 then
    L16_1 = pcall
    L17_1 = mp
    L17_1 = L17_1.IsKnownFriendlyFile
    L18_1 = L14_1
    L19_1 = false
    L20_1 = false
    L16_1, L17_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
    if L16_1 then
      if L17_1 then
        L18_1 = mp
        L18_1 = L18_1.ReportLowfi
        L19_1 = L14_1
        L20_1 = 2557680683
        L18_1(L19_1, L20_1)
      else
        L18_1 = false
        if L7_1 ~= nil then
          if L7_1 == "nodejs" then
            L19_1 = mp
            L19_1 = L19_1.ReportLowfi
            L20_1 = L14_1
            L21_1 = 4099585109
            L19_1(L20_1, L21_1)
            L18_1 = true
          elseif L7_1 == "wsh" then
            L19_1 = mp
            L19_1 = L19_1.ReportLowfi
            L20_1 = L14_1
            L21_1 = 3351996639
            L19_1(L20_1, L21_1)
            L18_1 = true
          elseif L7_1 == "downloader" then
            L19_1 = mp
            L19_1 = L19_1.ReportLowfi
            L20_1 = L14_1
            L21_1 = 983383434
            L19_1(L20_1, L21_1)
            L18_1 = true
          elseif L7_1 == "dll_loader" then
            L19_1 = mp
            L19_1 = L19_1.ReportLowfi
            L20_1 = L14_1
            L21_1 = 752190164
            L19_1(L20_1, L21_1)
            L18_1 = true
          elseif L8_1 == "script" then
            L19_1 = mp
            L19_1 = L19_1.ReportLowfi
            L20_1 = L14_1
            L21_1 = 3703821902
            L19_1(L20_1, L21_1)
            L18_1 = true
          elseif L7_1 == "cmd" then
            L19_1 = mp
            L19_1 = L19_1.ReportLowfi
            L20_1 = L14_1
            L21_1 = 18026631
            L19_1(L20_1, L21_1)
            L18_1 = true
          end
        end
        if L18_1 == false then
          L19_1 = mp
          L19_1 = L19_1.ReportLowfi
          L20_1 = L14_1
          L21_1 = 3998179614
          L19_1(L20_1, L21_1)
        end
        L19_1 = AppendToRollingQueue
        L20_1 = "ScheduledTaskRelatedFileA"
        L21_1 = L14_1
        L22_1 = L4_1
        L19_1(L20_1, L21_1, L22_1)
      end
    end
    L18_1 = MpCommon
    L18_1 = L18_1.QueryPersistContext
    L19_1 = L14_1
    L20_1 = "SuspPathsFromSchTask"
    L18_1 = L18_1(L19_1, L20_1)
    if not L18_1 then
      L19_1 = MpCommon
      L19_1 = L19_1.AppendPersistContext
      L20_1 = L14_1
      L21_1 = "SuspPathsFromSchTask"
      L22_1 = 3600
      L19_1(L20_1, L21_1, L22_1)
    end
  end
end
L10_1 = mp
L10_1 = L10_1.INFECTED
return L10_1
