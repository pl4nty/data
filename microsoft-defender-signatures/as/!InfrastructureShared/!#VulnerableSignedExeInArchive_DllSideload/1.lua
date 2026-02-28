local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.LegalCopyright
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L4_1 = "asus"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
