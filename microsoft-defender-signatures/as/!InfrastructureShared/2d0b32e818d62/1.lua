local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = this_sigattrlog
L1_1 = L1_1[10]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = isnull
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L2_1 = L2_1.utf8p2
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[10]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[11]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = isnull
    L2_1 = this_sigattrlog
    L2_1 = L2_1[11]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[11]
      L0_1 = L1_1.utf8p2
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[12]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = isnull
      L2_1 = this_sigattrlog
      L2_1 = L2_1[12]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[12]
        L0_1 = L1_1.utf8p2
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[13]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = isnull
        L2_1 = this_sigattrlog
        L2_1 = L2_1[13]
        L2_1 = L2_1.utf8p2
        L1_1 = L1_1(L2_1)
        if not L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[13]
          L0_1 = L1_1.utf8p2
        end
      end
    end
  end
end
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pcall
L2_1 = mp
L2_1 = L2_1.GetExecutablesFromCommandLine
L3_1 = L0_1
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = #L2_1
    if not (L3_1 < 2) then
      goto lbl_90
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_90::
L3_1 = pcall
L4_1 = mp
L4_1 = L4_1.ContextualExpandEnvironmentVariables
L5_1 = #L2_1
L5_1 = L2_1[L5_1]
L3_1, L4_1 = L3_1(L4_1, L5_1)
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "mshta%.exe$"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = sysio
    L5_1 = L5_1.IsFileExists
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.IsKnownFriendlyFile
      L6_1 = L4_1
      L7_1 = false
      L8_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1)
      if L5_1 then
        goto lbl_125
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_125::
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "MSHTA_ExecSignedPE"
L7_1 = L4_1
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = bm
L5_1 = L5_1.add_related_file
L6_1 = L4_1
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.TriggerScanResource
L6_1 = "file"
L7_1 = L4_1
L5_1(L6_1, L7_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
