local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = IsLegacyOrgMachine
L0_1 = L0_1()
if not L0_1 then
  L0_1 = IsTechniqueObservedForPid
  L1_1 = "BM"
  L2_1 = "ttexclusion"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    L0_1 = IsTacticObservedForPid
    L1_1 = "BM"
    L2_1 = "ttexclusion"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      L0_1 = IsTacticObservedForPid
      L1_1 = "BM"
      L2_1 = "ttexclusion_cln"
      L0_1 = L0_1(L1_1, L2_1)
      if not L0_1 then
        goto lbl_26
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_26::
L0_1 = is_excluded_parent_proc_auto
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 300000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = bm_AddRelatedFileFromCommandLine
    L2_1 = L0_1.command_line
    L3_1 = nil
    L4_1 = nil
    L5_1 = 1
    L1_1(L2_1, L3_1, L4_1, L5_1)
    L1_1 = AddResearchData
    L2_1 = L0_1.ppid
    L3_1 = true
    L1_1(L2_1, L3_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
