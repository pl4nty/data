local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = is_excluded_parent_proc_auto
L0_1 = L0_1()
if not L0_1 then
  L0_1 = IsSenseRelatedProc
  L0_1 = L0_1()
  if L0_1 ~= true then
    L0_1 = IsProcNameInParentProcessTree
    L1_1 = "BM"
    L2_1 = {}
    L3_1 = "csrss.exe"
    L4_1 = "aw.protectionagent.powershellexecutor64.exe"
    L5_1 = "vmware.hub.sfdagent.deploycmd.exe"
    L6_1 = "agentexecutor.exe"
    L7_1 = "pdzipservice.exe"
    L8_1 = "santivirusic.exe"
    L9_1 = "segurazoic.exe"
    L10_1 = "svservice.exe"
    L11_1 = "amagentassist.exe"
    L12_1 = "bdantiransomware.exe"
    L13_1 = "acrodist.exe"
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
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_30
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_30::
L0_1 = this_sigattrlog
L0_1 = L0_1[12]
L0_1 = L0_1.matched
L1_1 = this_sigattrlog
L1_1 = L1_1[13]
L1_1 = L1_1.matched
L2_1 = this_sigattrlog
L2_1 = L2_1[14]
L2_1 = L2_1.matched
L3_1 = this_sigattrlog
L3_1 = L3_1[15]
L3_1 = L3_1.matched
if not L0_1 and not L1_1 and not L2_1 and not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = bm
L4_1 = L4_1.get_imagepath
L4_1 = L4_1()
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "\\windows defender\\msmpeng.exe"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "\\windows defender advanced threat protection\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    goto lbl_90
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_90::
L5_1 = bm
L5_1 = L5_1.get_current_process_startup_info
L5_1 = L5_1()
L6_1 = isnull
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = "unknown"
L7_1 = ""
if L0_1 then
  L6_1 = "QueueUserAPC"
  L8_1 = this_sigattrlog
  L8_1 = L8_1[12]
  L8_1 = L8_1.utf8p2
  if L8_1 then
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = this_sigattrlog
    L9_1 = L9_1[12]
    L9_1 = L9_1.utf8p2
    L8_1 = L8_1(L9_1)
    L7_1 = L8_1
  end
elseif L1_1 then
  L6_1 = "MapViewOfSection"
  L8_1 = this_sigattrlog
  L8_1 = L8_1[13]
  L8_1 = L8_1.utf8p2
  if L8_1 then
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = this_sigattrlog
    L9_1 = L9_1[13]
    L9_1 = L9_1.utf8p2
    L8_1 = L8_1(L9_1)
    L7_1 = L8_1
  end
elseif L2_1 then
  L6_1 = "WriteProcessMemory"
  L8_1 = this_sigattrlog
  L8_1 = L8_1[14]
  L8_1 = L8_1.utf8p2
  if L8_1 then
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = this_sigattrlog
    L9_1 = L9_1[14]
    L9_1 = L9_1.utf8p2
    L8_1 = L8_1(L9_1)
    L7_1 = L8_1
  end
elseif L3_1 then
  L6_1 = "VirtualAllocEx"
  L8_1 = this_sigattrlog
  L8_1 = L8_1[15]
  L8_1 = L8_1.utf8p2
  if L8_1 then
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = this_sigattrlog
    L9_1 = L9_1[15]
    L9_1 = L9_1.utf8p2
    L8_1 = L8_1(L9_1)
    L7_1 = L8_1
  end
end
L8_1 = ""
L9_1 = ""
if L7_1 ~= "" then
  L10_1 = pcall
  L11_1 = string
  L11_1 = L11_1.match
  L12_1 = L7_1
  L13_1 = "vmbaseaddress:(%d+)"
  L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1)
  if L10_1 and L11_1 then
    L8_1 = L11_1
  end
  L12_1 = pcall
  L13_1 = string
  L13_1 = L13_1.match
  L14_1 = L7_1
  L15_1 = "vmregionsize:(%d+)"
  L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1)
  if L12_1 and L13_1 then
    L9_1 = L13_1
  end
  if L9_1 == "" then
    L14_1 = pcall
    L15_1 = string
    L15_1 = L15_1.match
    L16_1 = L7_1
    L17_1 = "vmbytescopied:(%d+)"
    L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1)
    if L14_1 and L15_1 then
      L9_1 = L15_1
    end
  end
  if L9_1 == "" then
    L14_1 = pcall
    L15_1 = string
    L15_1 = L15_1.match
    L16_1 = L7_1
    L17_1 = "localvmallocregionsize:(%d+)"
    L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1)
    if L14_1 and L15_1 then
      L9_1 = L15_1
    end
  end
end
L10_1 = string
L10_1 = L10_1.match
L11_1 = L4_1
L12_1 = "\\([^\\]+)$"
L10_1 = L10_1(L11_1, L12_1)
if not L10_1 then
  L10_1 = "unknown"
end
L11_1 = {}
L11_1["smartscreen.exe"] = true
L11_1["runtimebroker.exe"] = true
L11_1["dllhost.exe"] = true
L11_1["consent.exe"] = true
L11_1["sihost.exe"] = true
L11_1["taskhostw.exe"] = true
L11_1["backgroundtaskhost.exe"] = true
L11_1["searchprotocolhost.exe"] = true
L11_1["werfault.exe"] = true
L11_1["audiodg.exe"] = true
L11_1["fontdrvhost.exe"] = true
L11_1["conhost.exe"] = true
L11_1["mrt.exe"] = true
L12_1 = L11_1[L10_1]
if not L12_1 then
  L12_1 = false
end
L13_1 = bm
L13_1 = L13_1.add_related_string
L14_1 = "INJECTION_TECHNIQUE: "
L15_1 = L6_1
L16_1 = bm
L16_1 = L16_1.RelatedStringBMReport
L13_1(L14_1, L15_1, L16_1)
L13_1 = bm
L13_1 = L13_1.add_related_string
L14_1 = "TARGET_PROCESS: "
L15_1 = L10_1
L16_1 = bm
L16_1 = L16_1.RelatedStringBMReport
L13_1(L14_1, L15_1, L16_1)
L13_1 = bm
L13_1 = L13_1.add_related_string
L14_1 = "TARGET_IMAGE_PATH: "
L15_1 = L4_1
L16_1 = bm
L16_1 = L16_1.RelatedStringBMReport
L13_1(L14_1, L15_1, L16_1)
L13_1 = bm
L13_1 = L13_1.add_related_string
L14_1 = "HIGH_VALUE_TARGET: "
L15_1 = tostring
L16_1 = L12_1
L15_1 = L15_1(L16_1)
L16_1 = bm
L16_1 = L16_1.RelatedStringBMReport
L13_1(L14_1, L15_1, L16_1)
if L8_1 ~= "" then
  L13_1 = bm
  L13_1 = L13_1.add_related_string
  L14_1 = "SHELLCODE_ADDRESS: "
  L15_1 = L8_1
  L16_1 = bm
  L16_1 = L16_1.RelatedStringBMReport
  L13_1(L14_1, L15_1, L16_1)
end
if L9_1 ~= "" then
  L13_1 = bm
  L13_1 = L13_1.add_related_string
  L14_1 = "SHELLCODE_SIZE: "
  L15_1 = L9_1
  L16_1 = bm
  L16_1 = L16_1.RelatedStringBMReport
  L13_1(L14_1, L15_1, L16_1)
end
L13_1 = L5_1.command_line
if L13_1 then
  L13_1 = bm
  L13_1 = L13_1.add_related_string
  L14_1 = "TARGET_CMDLINE: "
  L15_1 = string
  L15_1 = L15_1.lower
  L16_1 = L5_1.command_line
  L15_1 = L15_1(L16_1)
  L16_1 = bm
  L16_1 = L16_1.RelatedStringBMReport
  L13_1(L14_1, L15_1, L16_1)
end
L13_1 = {}
L13_1.technique = L6_1
L13_1.mitre_id = "T1055.012"
L13_1.target_process = L10_1
L13_1.target_path = L4_1
L13_1.high_value = L12_1
L13_1.shellcode_address = L8_1
L13_1.shellcode_size = L9_1
L14_1 = bm
L14_1 = L14_1.set_detection_string
L15_1 = safeJsonSerialize
L16_1 = L13_1
L15_1, L16_1, L17_1 = L15_1(L16_1)
L14_1(L15_1, L16_1, L17_1)
L14_1 = TrackPidAndTechniqueBM
L15_1 = L5_1.ppid
L16_1 = "T1055.012"
L17_1 = "earlybird_apc_injection_target"
L14_1(L15_1, L16_1, L17_1)
L14_1 = bm
L14_1 = L14_1.add_action
L15_1 = "SmsAsyncScanEvent"
L16_1 = 5000
L14_1(L15_1, L16_1)
L14_1 = bm
L14_1 = L14_1.add_action
L15_1 = "EmsScan"
L16_1 = 1000
L14_1(L15_1, L16_1)
L14_1 = add_parents
L14_1()
L14_1 = mp
L14_1 = L14_1.INFECTED
return L14_1
