local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = isTamperProtectionOn
L1_1 = false
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[24]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[25]
  L1_1 = L1_1.matched
  if not L1_1 then
    goto lbl_27
  end
end
L1_1 = versioning
L1_1 = L1_1.IsSeville
L1_1 = L1_1()
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_27::
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
if L1_1 then
  L3_1 = ipairs
  L4_1 = L1_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.ppid
    if L8_1 then
      L8_1 = L7_1.reason_ex
      if L8_1 then
        L8_1 = mp
        L8_1 = L8_1.bitand
        L9_1 = L7_1.reason_ex
        L10_1 = 1
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 == 1 then
          L8_1 = bm
          L8_1 = L8_1.add_related_process
          L9_1 = L7_1.ppid
          L8_1(L9_1)
        end
      end
    end
  end
end
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "TpState"
L5_1 = tostring
L6_1 = L0_1
L5_1 = L5_1(L6_1)
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
