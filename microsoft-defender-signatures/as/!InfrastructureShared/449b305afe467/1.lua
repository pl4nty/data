local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
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
L3_1 = ""
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
L2_1 = false
L3_1 = pcall
L4_1 = MpCommon
L4_1 = L4_1.QuerySessionInformation
L5_1 = L0_1.ppid
L6_1 = MpCommon
L6_1 = L6_1.WTSIsRemoteSession
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L4_1
_ = L3_1
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[12]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[12]
  L3_1 = L5_1.utf8p1
  L5_1 = this_sigattrlog
  L5_1 = L5_1[12]
  L5_1 = L5_1.utf8p2
  if L5_1 == "THREAT" then
    L5_1 = 10
    if L5_1 then
      goto lbl_76
      L4_1 = L5_1 or L4_1
    end
  end
  L4_1 = 5
end
::lbl_76::
L5_1 = this_sigattrlog
L5_1 = L5_1[13]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[13]
  L3_1 = L5_1.utf8p1
  L5_1 = this_sigattrlog
  L5_1 = L5_1[13]
  L5_1 = L5_1.utf8p2
  if L5_1 == "THREAT" then
    L5_1 = 10
    if L5_1 then
      goto lbl_93
      L4_1 = L5_1 or L4_1
    end
  end
  L4_1 = 5
end
::lbl_93::
L5_1 = this_sigattrlog
L5_1 = L5_1[14]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[14]
  L3_1 = L5_1.utf8p1
  L5_1 = this_sigattrlog
  L5_1 = L5_1[14]
  L5_1 = L5_1.utf8p2
  if L5_1 == "THREAT" then
    L5_1 = 10
    if L5_1 then
      goto lbl_110
      L4_1 = L5_1 or L4_1
    end
  end
  L4_1 = 5
end
::lbl_110::
L5_1 = this_sigattrlog
L5_1 = L5_1[15]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[15]
  L3_1 = L5_1.utf8p2
  L6_1 = L3_1
  L5_1 = L3_1.match
  L7_1 = "name=(.*);.*"
  L5_1 = L5_1(L6_1, L7_1)
  L3_1 = L5_1
  L4_1 = 5
end
L5_1 = this_sigattrlog
L5_1 = L5_1[16]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[16]
  L3_1 = L5_1.utf8p2
  L6_1 = L3_1
  L5_1 = L3_1.match
  L7_1 = "name=(.*);.*"
  L5_1 = L5_1(L6_1, L7_1)
  L3_1 = L5_1
  L4_1 = 5
end
L5_1 = this_sigattrlog
L5_1 = L5_1[17]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[17]
  L3_1 = L5_1.utf8p1
  L5_1 = this_sigattrlog
  L5_1 = L5_1[17]
  L5_1 = L5_1.utf8p2
  if L5_1 == "INFECTED" then
    L5_1 = 10
    if L5_1 then
      goto lbl_153
      L4_1 = L5_1 or L4_1
    end
  end
  L4_1 = 5
end
::lbl_153::
L5_1 = MpCommon
L5_1 = L5_1.QuerySessionInformation
L6_1 = L0_1.ppid
L7_1 = MpCommon
L7_1 = L7_1.WTSUserName
L5_1 = L5_1(L6_1, L7_1)
L6_1 = bm
L6_1 = L6_1.get_imagepath
L6_1 = L6_1()
L8_1 = L6_1
L7_1 = L6_1.match
L9_1 = "([^\\]+)$"
L7_1 = L7_1(L8_1, L9_1)
L8_1 = L7_1
L9_1 = "_"
L10_1 = tostring
L11_1 = L5_1
L10_1 = L10_1(L11_1)
L8_1 = L8_1 .. L9_1 .. L10_1
L9_1 = hasSeenBefore
L10_1 = L8_1
L11_1 = L3_1
L12_1 = 7
L13_1 = "RemoteTamperingAttemptInMachine"
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
if not L9_1 or L10_1 < 3 then
  L11_1 = 7200
  L12_1 = 1000
  L13_1 = "TamperingAlerts_Remote"
  L14_1 = AppendToRollingQueue
  L15_1 = L13_1
  L16_1 = L7_1
  L17_1 = "_"
  L18_1 = L3_1
  L16_1 = L16_1 .. L17_1 .. L18_1
  L17_1 = L4_1
  L18_1 = L11_1
  L19_1 = L12_1
  L14_1(L15_1, L16_1, L17_1, L18_1, L19_1)
  L14_1 = GetRollingQueueSumOfValues
  L15_1 = L13_1
  L14_1 = L14_1(L15_1)
  if 15 <= L14_1 then
    L15_1 = GetRollingQueue
    L16_1 = L13_1
    L15_1 = L15_1(L16_1)
    L16_1 = bm
    L16_1 = L16_1.add_related_string
    L17_1 = "Alerts"
    L18_1 = safeJsonSerialize
    L19_1 = L15_1
    L18_1 = L18_1(L19_1)
    L19_1 = bm
    L19_1 = L19_1.RelatedStringBMReport
    L16_1(L17_1, L18_1, L19_1)
    L16_1 = reportSessionInformationInclusive
    L16_1()
    L16_1 = add_parents
    L16_1()
    L16_1 = mp
    L16_1 = L16_1.INFECTED
    return L16_1
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
