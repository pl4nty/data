local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 256 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 5
L1_1 = L1_1(L2_1, L3_1)
if L0_1 == 1145330259 and L1_1 == 858255496 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "LUA:MS_SZDD_winsfx"
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 == 1245796171 and L1_1 == 3509055624 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "LUA:MS_KWAJ_winsfx"
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 == 5 and L1_1 == 1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "LUA:PakFileHdr"
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
