local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 3 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if not (L0_1 < 2048) then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if not (20480 < L0_1) then
    goto lbl_21
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_21::
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.readfile
L1_1 = pesecs
L1_1 = L1_1[3]
L1_1 = L1_1.PointerToRawData
L2_1 = 32
L0_1 = L0_1(L1_1, L2_1)
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "^%x+$"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.gsub
  L2_1 = L0_1
  L3_1 = "%x"
  L4_1 = ""
  L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1)
  if L2_1 == 32 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
