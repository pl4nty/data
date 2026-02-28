local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = GetAppomalyProcessAttribute
L2_1 = L0_1.ppid
L1_1, L2_1 = L1_1(L2_1)
if not L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = reportSessionInformation
L3_1()
L3_1 = add_parents
L3_1()
L3_1 = reportRelevantUntrustedEntities
L4_1 = 0
L3_1(L4_1)
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = "LolBinsWin"
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.matched
  if L4_1 then
    L3_1 = "ExploratoryCommands"
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.matched
    if L4_1 then
      L3_1 = "InterestingPSCommands"
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L4_1 = L4_1.matched
      if L4_1 then
        L3_1 = "InterestingCmdArgs"
      end
    end
  end
end
L4_1 = bm
L4_1 = L4_1.add_related_string
L5_1 = "DetectorID"
L6_1 = L3_1
L7_1 = bm
L7_1 = L7_1.RelatedStringBMReport
L4_1(L5_1, L6_1, L7_1)
L4_1 = {}
L5_1 = "LolBinsWin"
L6_1 = "ExploratoryCommands"
L7_1 = "InterestingPSCommands"
L8_1 = "InterestingCmdArgs"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L5_1 = {}
L6_1 = ipairs
L7_1 = L4_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L11_1 = GetRollingQueueKeyValues
  L12_1 = "PFApp_Pid_"
  L13_1 = L10_1
  L12_1 = L12_1 .. L13_1
  L13_1 = L0_1.ppid
  L11_1 = L11_1(L12_1, L13_1)
  L12_1 = {}
  L5_1[L10_1] = L12_1
  L12_1 = 0
  L13_1 = ipairs
  L14_1 = L11_1
  L13_1, L14_1, L15_1 = L13_1(L14_1)
  for L16_1, L17_1 in L13_1, L14_1, L15_1 do
    L18_1 = L17_1.value
    L18_1 = L5_1[L18_1]
    if not L18_1 and L12_1 < 10 then
      L18_1 = L5_1[L10_1]
      L19_1 = L17_1.value
      L18_1[L19_1] = true
      L12_1 = L12_1 + 1
    end
  end
end
L6_1 = bm
L6_1 = L6_1.add_related_string
L7_1 = "Exploratory_Commands"
L8_1 = safeJsonSerialize
L9_1 = L5_1
L8_1 = L8_1(L9_1)
L9_1 = bm
L9_1 = L9_1.RelatedStringBMReport
L6_1(L7_1, L8_1, L9_1)
if L0_1 then
  L6_1 = "ExploratoryCmd["
  L7_1 = L0_1.ppid
  L8_1 = L7_1
  L7_1 = L7_1.match
  L9_1 = "pid:(%d+)"
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = "]"
  L6_1 = L6_1 .. L7_1 .. L8_1
  L7_1 = {}
  L7_1.InterestingCommands = L5_1
  L8_1 = IncreaseProcessAnomalyScore
  L9_1 = L0_1.ppid
  L10_1 = 5
  L11_1 = L6_1
  L12_1 = L1_1
  L13_1 = L7_1
  L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
