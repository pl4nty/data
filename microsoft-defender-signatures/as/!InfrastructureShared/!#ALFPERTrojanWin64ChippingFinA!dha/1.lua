local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 41943040 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.get_versioninfo
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.OriginalFilename
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 ~= "zlibwapi.dll" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = pehdr
L3_1 = L3_1.DataDirectory
L3_1 = L3_1[1]
L3_1 = L3_1.RVA
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = pe
L5_1 = L5_1.foffset_rva
L6_1 = L3_1
L5_1 = L5_1(L6_1)
L6_1 = 36
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = L4_1
L7_1 = 25
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= 137 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
