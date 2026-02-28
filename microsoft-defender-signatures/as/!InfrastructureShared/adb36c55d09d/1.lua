local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    L1_1 = GetAppomalyProcessAttribute
    L2_1 = L0_1.ppid
    L1_1 = L1_1(L2_1)
    if L1_1 then
      goto lbl_17
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = true
L2_1 = GetRollingQueueCountForKey
L3_1 = "PFApp_Parent_FileDropped"
L4_1 = L0_1.ppid
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == 0 then
  L1_1 = false
end
L2_1 = GetRollingQueueKeyValues
L3_1 = "PFApp_Parent_FileDropped"
L4_1 = L0_1.ppid
L2_1 = L2_1(L3_1, L4_1)
L3_1 = {}
L4_1 = 0
L5_1 = ipairs
L6_1 = L2_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = L9_1.value
  L10_1 = L3_1[L10_1]
  if not L10_1 and L4_1 < 20 then
    L10_1 = L9_1.value
    L3_1[L10_1] = true
    L10_1 = bm
    L10_1 = L10_1.add_related_file
    L11_1 = L9_1.value
    L10_1(L11_1)
    L4_1 = L4_1 + 1
  end
end
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "Shellcode"
L7_1 = safeJsonSerialize
L8_1 = L3_1
L7_1 = L7_1(L8_1)
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = reportSessionInformation
L5_1()
L5_1 = add_parents
L5_1()
L5_1 = reportRelevantUntrustedEntities
L6_1 = 0
L5_1(L6_1)
L5_1 = nil
L6_1 = this_sigattrlog
L6_1 = L6_1[1]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = bm
  L6_1 = L6_1.add_related_string
  L7_1 = "DetectorID"
  L8_1 = "LolBinsWin"
  L9_1 = bm
  L9_1 = L9_1.RelatedStringBMReport
  L6_1(L7_1, L8_1, L9_1)
  L5_1 = "LolBinsWin"
else
  L6_1 = this_sigattrlog
  L6_1 = L6_1[2]
  L6_1 = L6_1.matched
  if L6_1 then
    L6_1 = bm
    L6_1 = L6_1.add_related_string
    L7_1 = "DetectorID"
    L8_1 = "ExploratoryCommands"
    L9_1 = bm
    L9_1 = L9_1.RelatedStringBMReport
    L6_1(L7_1, L8_1, L9_1)
    L5_1 = "ExploratoryCommands"
  else
    L6_1 = this_sigattrlog
    L6_1 = L6_1[3]
    L6_1 = L6_1.matched
    if L6_1 then
      L6_1 = bm
      L6_1 = L6_1.add_related_string
      L7_1 = "DetectorID"
      L8_1 = "InterestingPSCommands"
      L9_1 = bm
      L9_1 = L9_1.RelatedStringBMReport
      L6_1(L7_1, L8_1, L9_1)
      L5_1 = "InterestingPSCommands"
    else
      L6_1 = this_sigattrlog
      L6_1 = L6_1[4]
      L6_1 = L6_1.matched
      if L6_1 then
        L6_1 = bm
        L6_1 = L6_1.add_related_string
        L7_1 = "DetectorID"
        L8_1 = "InterestingCmdArgs"
        L9_1 = bm
        L9_1 = L9_1.RelatedStringBMReport
        L6_1(L7_1, L8_1, L9_1)
        L5_1 = "InterestingCmdArgs"
      end
    end
  end
end
L6_1 = GetRollingQueueKeyValues
L7_1 = "PFApp_Pid_"
L8_1 = L5_1
L7_1 = L7_1 .. L8_1
L8_1 = L0_1.ppid
L6_1 = L6_1(L7_1, L8_1)
L7_1 = {}
L8_1 = 0
L9_1 = ipairs
L10_1 = L6_1
L9_1, L10_1, L11_1 = L9_1(L10_1)
for L12_1, L13_1 in L9_1, L10_1, L11_1 do
  L14_1 = L13_1.value
  L14_1 = L7_1[L14_1]
  if not L14_1 and L8_1 < 20 then
    L14_1 = L13_1.value
    L7_1[L14_1] = true
    L8_1 = L8_1 + 1
  end
end
if not L1_1 then
  L9_1 = bm
  L9_1 = L9_1.trigger_sig
  L10_1 = "ExploratoryCmd_TrackedApps"
  L11_1 = safeJsonSerialize
  L12_1 = L7_1
  L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L11_1(L12_1)
  L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = bm
L9_1 = L9_1.add_related_string
L10_1 = "Exploratory_Commands"
L11_1 = safeJsonSerialize
L12_1 = L7_1
L11_1 = L11_1(L12_1)
L12_1 = bm
L12_1 = L12_1.RelatedStringBMReport
L9_1(L10_1, L11_1, L12_1)
L9_1 = "AnomalousFileDropExploratoryCmd["
L10_1 = L0_1.ppid
L11_1 = L10_1
L10_1 = L10_1.match
L12_1 = "pid:(%d+)"
L10_1 = L10_1(L11_1, L12_1)
L11_1 = "]"
L9_1 = L9_1 .. L10_1 .. L11_1
L10_1 = {}
L10_1.DetectorID = L5_1
L10_1.InterestingCommands = L7_1
L11_1 = IncreaseProcessAnomalyScore
L12_1 = L0_1.ppid
L13_1 = 5
L14_1 = L9_1
L15_1 = "PFApp_Parent"
L16_1 = L10_1
L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
L11_1 = mp
L11_1 = L11_1.INFECTED
return L11_1
