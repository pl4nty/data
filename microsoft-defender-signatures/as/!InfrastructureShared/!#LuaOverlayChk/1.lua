local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 102400 then
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
if 102400 < L2_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:OverlayGT100"
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "Lua:OverlayLE100"
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
