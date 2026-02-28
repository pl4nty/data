local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = IsSenseRelatedProc
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = {}
L2_1 = {}
L3_1 = "cmd.exe"
L4_1 = "WindowsDefenderATPOnboardingScript.cmd"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = {}
L4_1 = ""
L5_1 = "Onboarding"
L3_1[1] = L4_1
L3_1[2] = L5_1
L4_1 = {}
L5_1 = "powershell.exe"
L6_1 = "Microsoft\\Windows Defender Advanced Threat Protection\\"
L4_1[1] = L5_1
L4_1[2] = L6_1
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L2_1 = checkParentCmdline
L3_1 = L0_1.ppid
L4_1 = L1_1
L5_1 = 2
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[12]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[12]
  L2_1 = L4_1.utf8p1
  L4_1 = this_sigattrlog
  L4_1 = L4_1[12]
  L4_1 = L4_1.utf8p2
  if L4_1 == "THREAT" then
    L4_1 = 10
    if L4_1 then
      goto lbl_61
      L3_1 = L4_1 or L3_1
    end
  end
  L3_1 = 5
end
::lbl_61::
L4_1 = this_sigattrlog
L4_1 = L4_1[13]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[13]
  L2_1 = L4_1.utf8p1
  L4_1 = this_sigattrlog
  L4_1 = L4_1[13]
  L4_1 = L4_1.utf8p2
  if L4_1 == "THREAT" then
    L4_1 = 10
    if L4_1 then
      goto lbl_78
      L3_1 = L4_1 or L3_1
    end
  end
  L3_1 = 5
end
::lbl_78::
L4_1 = this_sigattrlog
L4_1 = L4_1[14]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[14]
  L2_1 = L4_1.utf8p1
  L4_1 = this_sigattrlog
  L4_1 = L4_1[14]
  L4_1 = L4_1.utf8p2
  if L4_1 == "THREAT" then
    L4_1 = 10
    if L4_1 then
      goto lbl_95
      L3_1 = L4_1 or L3_1
    end
  end
  L3_1 = 5
end
::lbl_95::
L4_1 = this_sigattrlog
L4_1 = L4_1[15]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[15]
  L2_1 = L4_1.utf8p2
  L5_1 = L2_1
  L4_1 = L2_1.match
  L6_1 = "name=(.*);.*"
  L4_1 = L4_1(L5_1, L6_1)
  L2_1 = L4_1
  L3_1 = 5
end
L4_1 = this_sigattrlog
L4_1 = L4_1[16]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[16]
  L2_1 = L4_1.utf8p2
  L5_1 = L2_1
  L4_1 = L2_1.match
  L6_1 = "name=(.*);.*"
  L4_1 = L4_1(L5_1, L6_1)
  L2_1 = L4_1
  L3_1 = 5
end
L4_1 = this_sigattrlog
L4_1 = L4_1[17]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[17]
  L2_1 = L4_1.utf8p2
  L5_1 = L2_1
  L4_1 = L2_1.match
  L6_1 = "name=(.*);.*"
  L4_1 = L4_1(L5_1, L6_1)
  L2_1 = L4_1
  L3_1 = 5
end
L4_1 = this_sigattrlog
L4_1 = L4_1[18]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[18]
  L2_1 = L4_1.utf8p2
  L5_1 = L2_1
  L4_1 = L2_1.match
  L6_1 = "name=(.*);.*"
  L4_1 = L4_1(L5_1, L6_1)
  L2_1 = L4_1
  L3_1 = 10
end
L4_1 = this_sigattrlog
L4_1 = L4_1[19]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[19]
  L2_1 = L4_1.utf8p1
  L4_1 = this_sigattrlog
  L4_1 = L4_1[19]
  L4_1 = L4_1.utf8p2
  if L4_1 == "INFECTED" then
    L4_1 = 10
    if L4_1 then
      goto lbl_164
      L3_1 = L4_1 or L3_1
    end
  end
  L3_1 = 5
end
::lbl_164::
L4_1 = false
L5_1 = MpCommon
L5_1 = L5_1.StringRegExpSearch
L6_1 = "(Block|RTP|GpDisable|Srv)"
L7_1 = L2_1
L5_1, L6_1 = L5_1(L6_1, L7_1)
_ = L6_1
L4_1 = L5_1
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = 7200
L6_1 = 100
L7_1 = bm
L7_1 = L7_1.get_imagepath
L7_1 = L7_1()
L9_1 = L7_1
L8_1 = L7_1.match
L10_1 = "([^\\]+)$"
L8_1 = L8_1(L9_1, L10_1)
L9_1 = hasSeenBefore
L10_1 = L8_1
L11_1 = L2_1
L12_1 = 7
L13_1 = "TamperingAttemptInMachine"
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
if not L9_1 or L10_1 < 3 then
  L11_1 = AppendToRollingQueue
  L12_1 = "TamperingAlerts"
  L13_1 = L8_1
  L14_1 = "_"
  L15_1 = L2_1
  L13_1 = L13_1 .. L14_1 .. L15_1
  L14_1 = L3_1
  L15_1 = L5_1
  L16_1 = L6_1
  L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
end
L11_1 = MpCommon
L11_1 = L11_1.EnumThreatHistory
L12_1 = "HackTool"
L13_1 = 600
L14_1 = crypto
L14_1 = L14_1.bitor
L15_1 = MpCommon
L15_1 = L15_1.THREAT_HISTORY_CATEGORY_ASR
L16_1 = MpCommon
L16_1 = L16_1.THREAT_HISTORY_CATEGORY_NP
L14_1, L15_1, L16_1, L17_1 = L14_1(L15_1, L16_1)
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
L12_1 = #L11_1
if not (0 < L12_1) then
  L12_1 = GetRollingQueueCount
  L13_1 = "ThreatsOnMachine_Lua"
  L12_1 = L12_1(L13_1)
  if not (0 < L12_1) then
    L12_1 = GetRollingQueueSumOfValues
    L13_1 = "TamperingAlerts"
    L12_1 = L12_1(L13_1)
    if not (15 <= L12_1) then
      goto lbl_268
    end
  end
end
L12_1 = GetRollingQueue
L13_1 = "TamperingAlerts"
L12_1 = L12_1(L13_1)
L13_1 = GetRollingQueue
L14_1 = "ThreatsOnMachine_Lua"
L13_1 = L13_1(L14_1)
L14_1 = bm
L14_1 = L14_1.add_related_string
L15_1 = "HackToolsSeenOnDevice_Lua"
L16_1 = safeJsonSerialize
L17_1 = L13_1
L16_1 = L16_1(L17_1)
L17_1 = bm
L17_1 = L17_1.RelatedStringBMReport
L14_1(L15_1, L16_1, L17_1)
L14_1 = bm
L14_1 = L14_1.add_related_string
L15_1 = "HackToolsSeenOnDevice"
L16_1 = safeJsonSerialize
L17_1 = L11_1
L16_1 = L16_1(L17_1)
L17_1 = bm
L17_1 = L17_1.RelatedStringBMReport
L14_1(L15_1, L16_1, L17_1)
L14_1 = bm
L14_1 = L14_1.add_related_string
L15_1 = "TamperingAlertsOnDevice"
L16_1 = safeJsonSerialize
L17_1 = L12_1
L16_1 = L16_1(L17_1)
L17_1 = bm
L17_1 = L17_1.RelatedStringBMReport
L14_1(L15_1, L16_1, L17_1)
L14_1 = add_parents
L14_1()
L14_1 = mp
L14_1 = L14_1.INFECTED
do return L14_1 end
::lbl_268::
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
