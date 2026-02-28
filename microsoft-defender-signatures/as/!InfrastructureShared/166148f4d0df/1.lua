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
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = ipairs
L3_1 = mp
L3_1 = L3_1.enum_mpattributesubstring
L4_1 = ""
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1)
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = table
  L7_1 = L7_1.insert
  L8_1 = L1_1
  L9_1 = L6_1
  L7_1(L8_1, L9_1)
end
L2_1 = table
L2_1 = L2_1.concat
L3_1 = L1_1
L4_1 = ";"
L2_1 = L2_1(L3_1, L4_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "Detection:"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.BmTriggerSig
  L3_1 = L0_1
  L4_1 = "SmsNamedAttributes.A"
  L5_1 = L1_1
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
