local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.GetHSTRCallerId
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.HSTR_CALLER_SMS
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = getDetectedRegions
L0_1 = L0_1()
L1_1 = pairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = L5_1.size
  if L6_1 <= 16384 then
    L6_1 = L5_1.prot
    if L6_1 ~= 32 then
      L6_1 = L5_1.prot
      if L6_1 ~= 4 then
        goto lbl_39
      end
    end
    L6_1 = L5_1.state_type
    L7_1 = mp
    L7_1 = L7_1.bitor
    L8_1 = mp
    L8_1 = L8_1.SMS_MBI_COMMIT
    L9_1 = mp
    L9_1 = L9_1.SMS_MBI_PRIVATE
    L7_1 = L7_1(L8_1, L9_1)
    if L6_1 == L7_1 then
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
  ::lbl_39::
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
