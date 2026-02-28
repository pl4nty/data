local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if 536870912 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.readu_u32
  L1_1 = headerpage
  L2_1 = 1
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 < 553648128 then
    L0_1 = mp
    L0_1 = L0_1.readprotection
    L1_1 = false
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.readfile
    L1_1 = 0
    L2_1 = 4
    L0_1 = L0_1(L1_1, L2_1)
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = tostring
    L3_1 = L0_1
    L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "rem "
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "Lua:UnknownBigFile_GT20M"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
