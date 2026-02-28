local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
    L2_1[1] = L3_1
    L2_1[2] = L4_1
    L2_1[3] = L5_1
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_22
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_22::
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = next
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = L0_1.command_line
    if L1_1 then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = L0_1.command_line
      L1_1 = L1_1(L2_1)
      L2_1 = bm_AddRelatedFileFromCommandLine
      L3_1 = L1_1
      L4_1 = nil
      L5_1 = nil
      L6_1 = 1
      L2_1(L3_1, L4_1, L5_1, L6_1)
      L2_1 = bm
      L2_1 = L2_1.add_related_file
      L3_1 = L1_1
      L2_1(L3_1)
      L2_1 = bm
      L2_1 = L2_1.add_related_string
      L3_1 = "[->] MALICIOUS SCRIPT: "
      L4_1 = L1_1
      L5_1 = bm
      L5_1 = L5_1.RelatedStringBMReport
      L2_1(L3_1, L4_1, L5_1)
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
