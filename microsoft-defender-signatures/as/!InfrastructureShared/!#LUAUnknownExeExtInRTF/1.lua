local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 400000 or 1000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1, L3_1, L4_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "%-%>%(rtf[0-9]+%)%-%>[a-z]+.exe$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
