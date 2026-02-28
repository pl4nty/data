local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 208000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pesecs
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.PointerToRawData
L2_1 = pesecs
L3_1 = pehdr
L3_1 = L3_1.NumberOfSections
L2_1 = L2_1[L3_1]
L2_1 = L2_1.SizeOfRawData
L1_1 = L1_1 + L2_1
L2_1 = L0_1 - L1_1
if L2_1 == 54133 or L2_1 == 53941 or L2_1 == 55632 or L2_1 == 55640 then
  L3_1 = pe
  L3_1 = L3_1.set_peattribute
  L4_1 = "deep_analysis"
  L5_1 = true
  L3_1(L4_1, L5_1)
  L3_1 = pe
  L3_1 = L3_1.set_peattribute
  L4_1 = "disable_apicall_limit"
  L5_1 = true
  L3_1(L4_1, L5_1)
  L3_1 = pe
  L3_1 = L3_1.reemulate
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
