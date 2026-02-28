local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 <= 120000000 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "//LUA:ZipRar7ZFileLE120M.A"
  L1_1(L2_1)
end
if L0_1 <= 80000000 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "//LUA:ZipRar7ZFileLE80M.A"
  L1_1(L2_1)
end
if L0_1 <= 40000000 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "//LUA:ZipRar7ZFileLE40M.A"
  L1_1(L2_1)
end
if L0_1 <= 10000000 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "//LUA:ZipRar7ZFileLE10M.A"
  L1_1(L2_1)
end
if L0_1 <= 5000000 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "//LUA:ZipRar7ZFileLE5M.A"
  L1_1(L2_1)
end
if L0_1 <= 1000000 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "//LUA:ZipRar7ZFileLE1M.A"
  L1_1(L2_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
