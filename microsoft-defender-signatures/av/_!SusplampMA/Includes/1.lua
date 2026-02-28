local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 1
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 then
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_17
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_17::
if 536870912 < L1_1 and L1_1 < 553648128 then
  L2_1 = mp
  L2_1 = L2_1.readprotection
  L3_1 = false
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.readfile
  L3_1 = 0
  L4_1 = 4
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = tostring
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L4_1 = mp
  L4_1 = L4_1.readprotection
  L5_1 = true
  L4_1(L5_1)
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "rem "
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 ~= nil then
    L4_1 = "SusLampz"
    L5_1 = 3600
    L6_1 = 15
    L7_1 = AppendToRollingQueue
    L8_1 = L4_1
    L9_1 = "lampz"
    L10_1 = 1
    L11_1 = L5_1
    L12_1 = L6_1
    L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
