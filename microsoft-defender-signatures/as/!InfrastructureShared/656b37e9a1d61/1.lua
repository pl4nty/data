local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
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
    L2_1[1] = L3_1
    L2_1[2] = L4_1
    L2_1[3] = L5_1
    L2_1[4] = L6_1
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_23
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_23::
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[10]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[10]
  L0_1 = L1_1.utf8p2
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[11]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[11]
    L0_1 = L1_1.utf8p2
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[12]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[12]
      L0_1 = L1_1.utf8p2
    end
  end
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "^([0-9]+);regionsize:([0-9]+)"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_68
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_68::
L3_1 = tonumber
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
L3_1 = tonumber
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1.ppid
L5_1 = bm
L5_1 = L5_1.GetProcAddress
L6_1 = L4_1
L7_1 = "rpcrt4.dll"
L8_1 = "NdrClientCall3"
L5_1 = L5_1(L6_1, L7_1, L8_1)
L6_1 = isnull
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm
L6_1 = L6_1.VirtualQuery
L7_1 = L5_1
L6_1, L7_1 = L6_1(L7_1)
if L6_1 then
  L8_1 = isnull
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    goto lbl_116
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_116::
L8_1 = L7_1.base_addr
if L8_1 == L1_1 then
  L8_1 = bm
  L8_1 = L8_1.get_imagepath
  L8_1 = L8_1()
  L9_1 = isnull
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if L9_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = checkFileLastWriteTime
  L10_1 = L8_1
  L11_1 = 300
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    L9_1 = string
    L9_1 = L9_1.lower
    L10_1 = L3_1.command_line
    L9_1 = L9_1(L10_1)
    L10_1 = bm_AddRelatedFileFromCommandLine
    L11_1 = L9_1
    L12_1 = nil
    L13_1 = nil
    L14_1 = 1
    L10_1(L11_1, L12_1, L13_1, L14_1)
    L10_1 = bm
    L10_1 = L10_1.add_related_file
    L11_1 = L9_1
    L10_1(L11_1)
    L10_1 = bm
    L10_1 = L10_1.add_related_string
    L11_1 = "[->] MALICIOUS SCRIPT: "
    L12_1 = L9_1
    L13_1 = bm
    L13_1 = L13_1.RelatedStringBMReport
    L10_1(L11_1, L12_1, L13_1)
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
