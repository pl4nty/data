local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.command_line
L1_1 = L1_1(L2_1)
L2_1 = {}
L3_1 = "azure"
L4_1 = "datadog"
L5_1 = "splunk"
L6_1 = "servicenow"
L7_1 = "\\windows\\system32\\"
L8_1 = "\\windows\\syswow64\\"
L9_1 = "program files\\microsoft"
L10_1 = "checkmk"
L11_1 = "TaniumReceiver.exe"
L12_1 = "SQLAGENT.EXE"
L13_1 = "frontserver.exe"
L14_1 = "launchpad.exe"
L15_1 = "nssm.exe"
L16_1 = "PythonService.exe"
L17_1 = "agent.exe"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L2_1[12] = L14_1
L2_1[13] = L15_1
L2_1[14] = L16_1
L2_1[15] = L17_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L3_1 = L3_1()
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1.image_path
L5_1 = {}
L6_1 = "\\windows\\system32\\"
L7_1 = "\\windows\\syswow64\\"
L8_1 = "TaniumReceiver.exe"
L9_1 = "SQLAGENT.EXE"
L10_1 = "frontserver.exe"
L11_1 = "launchpad.exe"
L12_1 = "nssm.exe"
L13_1 = "PythonService.exe"
L14_1 = "agent.exe"
L15_1 = "checkmk"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
L5_1[6] = L11_1
L5_1[7] = L12_1
L5_1[8] = L13_1
L5_1[9] = L14_1
L5_1[10] = L15_1
L6_1 = contains
L7_1 = L4_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm_AddRelatedFileFromCommandLine
L7_1 = L1_1
L8_1 = nil
L9_1 = nil
L10_1 = 1
L6_1(L7_1, L8_1, L9_1, L10_1)
L6_1 = L0_1.ppid
if L6_1 then
  L6_1 = bm
  L6_1 = L6_1.request_SMS
  L7_1 = L0_1.ppid
  L8_1 = "h+"
  L6_1(L7_1, L8_1)
  L6_1 = bm
  L6_1 = L6_1.add_action
  L7_1 = "SmsAsyncScanEvent"
  L8_1 = 1
  L6_1(L7_1, L8_1)
end
L6_1 = bm
L6_1 = L6_1.add_related_string
L7_1 = "[->] COMMAND: "
L8_1 = L0_1.command_line
L9_1 = bm
L9_1 = L9_1.RelatedStringBMReport
L6_1(L7_1, L8_1, L9_1)
L6_1 = pcallEx
L7_1 = "triggerMemoryScanOnProcessTree"
L8_1 = triggerMemoryScanOnProcessTree
L9_1 = false
L10_1 = true
L11_1 = "SMS_H"
L12_1 = 5000
L13_1 = "Behavior:Win32/SusMemExecs.MK!sms"
L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L6_1 = add_parents
L6_1()
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
