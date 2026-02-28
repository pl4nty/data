local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[12]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = isnull
  L1_1 = this_sigattrlog
  L1_1 = L1_1[12]
  L1_1 = L1_1.utf8p2
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_16
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.GetExecutablesFromCommandLine
L2_1 = this_sigattrlog
L2_1 = L2_1[12]
L2_1 = L2_1.utf8p2
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = #L1_1
    if not (L2_1 < 2) then
      goto lbl_36
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_36::
L2_1 = mp
L2_1 = L2_1.ContextualExpandEnvironmentVariables
L3_1 = #L1_1
L3_1 = L1_1[L3_1]
L2_1 = L2_1(L3_1)
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "mshta%.exe$"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = sysio
    L3_1 = L3_1.IsFileExists
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.IsKnownFriendlyFile
      L4_1 = L2_1
      L5_1 = false
      L6_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 then
        goto lbl_70
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_70::
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "MSHTA_ExecSignedPE"
L5_1 = L2_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = bm
L3_1 = L3_1.add_related_file
L4_1 = L2_1
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.TriggerScanResource
L4_1 = "file"
L5_1 = L2_1
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
