local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = string
L1_1 = L1_1.sub
L2_1 = pe
L2_1 = L2_1.get_versioninfo
L2_1 = L2_1()
L2_1 = L2_1.ProductName
L3_1 = 1
L4_1 = 5
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1, L4_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 == "award" then
  L0_1 = mp
  L0_1 = L0_1.HSTR_WEIGHT
  if 14 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "HSTR:PossibleKeylogger"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.hasexports
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
