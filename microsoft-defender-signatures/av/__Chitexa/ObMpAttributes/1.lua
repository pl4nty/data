local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetLnkInfo
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.Arguments
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\RECYCLER.BIN\\"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil and 1 < L2_1 then
  L3_1 = string
  L3_1 = L3_1.byte
  L4_1 = L1_1
  L5_1 = L2_1 - 1
  L3_1 = L3_1(L4_1, L5_1)
  if 128 <= L3_1 and L3_1 <= 255 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
