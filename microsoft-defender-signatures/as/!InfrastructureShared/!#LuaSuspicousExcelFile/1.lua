local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 4095 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 2561
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 218959105 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = headerpage
L0_1 = L0_1[2565]
if L0_1 ~= 93 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "Lua:SuspiciousOfficeHeaderS101"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
