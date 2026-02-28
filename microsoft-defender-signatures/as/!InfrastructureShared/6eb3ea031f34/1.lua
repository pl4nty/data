local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L0_1 = L7_1.ppid
  if L0_1 then
    L8_1 = IsDetectionThresholdMet
    L9_1 = L0_1
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = IsTacticObservedForPid
      L9_1 = L0_1
      L10_1 = "credentialdumping"
      L8_1 = L8_1(L9_1, L10_1)
      if not L8_1 then
        L8_1 = IsTacticObservedForPid
        L9_1 = L0_1
        L10_1 = "impair_recovery"
        L8_1 = L8_1(L9_1, L10_1)
        if not L8_1 then
          goto lbl_31
        end
      end
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
  ::lbl_31::
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
