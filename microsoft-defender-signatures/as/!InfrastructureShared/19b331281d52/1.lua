local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p1
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = L1_1
L1_1 = L1_1.match
L3_1 = "([^\\]+%.exe)$"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "service.exe"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L4_1 = L1_1
  L3_1 = L1_1.sub
  L5_1 = 1
  L6_1 = L2_1 - 1
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L1_1 = L3_1
else
  L4_1 = L1_1
  L3_1 = L1_1.sub
  L5_1 = 1
  L6_1 = -5
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L1_1 = L3_1
end
L3_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\"
L4_1 = L1_1
L3_1 = L3_1 .. L4_1
L4_1 = sysio
L4_1 = L4_1.RegOpenKey
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
